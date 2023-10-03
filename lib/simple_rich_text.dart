library simple_rich_text;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'src/error.dart';
import 'src/extensions_string.dart';
import 'src/global_span.dart';
import 'src/logger.dart';

class GlobalSearchTerm {
  const GlobalSearchTerm({
    required this.line,
    required this.searchTerms,
  });

  final String line;
  final List<String> searchTerms;
}

class SimpleRichTextSearchController {
  SimpleRichTextSearchController({required this.onUpdate});
  List<GlobalKey> _globalKeys = [];

  final void Function() onUpdate;

  void updateChildren(List<GlobalSpan> children) {
    _globalKeys = children.map((e) => e.globalKey).whereType<GlobalKey>().toList();
    onUpdate();
  }

  GlobalKey? keyForIndex(int index) {
    if (index >= _globalKeys.length) {
      return null;
    }

    return _globalKeys[index];
  }

  int get length => _globalKeys.length;
}

class SimpleRichTextConfig {
  SimpleRichTextConfig({
    this.allowNonClosedTags = false,
    this.appendParagraphNumber = true,
    this.chars,
    this.maxLines,
    this.selectable = true,
    this.textAlign,
    this.textOverflow,
    this.textScaleFactor,
  });
  final bool appendParagraphNumber;
  final bool selectable;
  final double? textScaleFactor;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  /// allow non-closed tags (e.g., "this is *bold" because no closing * character), otherwise exception is thrown
  final bool allowNonClosedTags;

  /// User-defined chars, default chars set is [*~/_\\]
  final String? chars;
}

/// Widget that renders a string with sub-string highlighting.
class SimpleRichText extends HookWidget {
  const SimpleRichText({
    required this.text,
    required this.config,
    required this.style,
    super.key,
    this.onCopy,
    this.globalSearchTerm,
    this.leadingText,
    this.searchController,
    this.searchTerms = const [],
    this.trailingText,
  });

  /// controller for search
  final SimpleRichTextSearchController? searchController;
  final GlobalSearchTerm? globalSearchTerm;

  /// optional leading TextSpan
  final TextSpan? leadingText;

  /// optional trailing TextSpan
  final TextSpan? trailingText;

  /// The String to be displayed using rich text.
  final List<String> text;
  final List<String> searchTerms;
  final SimpleRichTextConfig config;
  final TextStyle style;
  final void Function(String?)? onCopy;

  @override
  Widget build(BuildContext context) {
    final selectedText = useRef<String?>(null);

    final formatted = text.asMap().entries.map((e) => _prepareText(e, context)).flattened;
    final children = [
      if (leadingText != null) leadingText!,
      ...formatted,
      if (trailingText != null) trailingText!,
    ];

    searchController?.updateChildren(children.whereType<GlobalSpan>().toList());
    final textWidget = Text.rich(
      TextSpan(children: children),
      maxLines: config.maxLines,
      textAlign: config.textAlign ?? TextAlign.justify,
      textScaler: config.textScaleFactor != null
          ? TextScaler.linear(config.textScaleFactor!)
          : MediaQuery.of(context).textScaler,
    );

    if (config.selectable) {
      return SelectionArea(
        onSelectionChanged: (value) => selectedText.value = value?.plainText,
        contextMenuBuilder: (context, state) {
          final copy = onCopy == null
              ? null
              : ContextMenuButtonItem(
                  type: ContextMenuButtonType.copy,
                  onPressed: () async {
                    onCopy?.call(selectedText.value);
                    state.hideToolbar(false);
                  },
                );
          var items = state.contextMenuButtonItems;

          if (copy != null) {
            items = items.where((element) => element.type != ContextMenuButtonType.copy).toList()..insert(0, copy);
          }
          return AdaptiveTextSelectionToolbar.buttonItems(
            anchors: state.contextMenuAnchors,
            buttonItems: items,
          );
        },
        child: textWidget,
      );
    }

    return textWidget;
  }

  Iterable<TextSpan> _prepareText(
    MapEntry<int, String> entry,
    BuildContext context,
  ) {
    var text = entry.value.highlightAllSearchTerms(
      terms: searchTerms,
      condition: (term) => term.length > 2,
    );

    if (searchTerms.isEmpty && globalSearchTerm != null && text.contains(globalSearchTerm!.line)) {
      final terms = globalSearchTerm?.searchTerms ?? [];
      text = text.highlightAllSearchTerms(terms: terms);
    }

    if (text.isEmpty) {
      return [const TextSpan()];
    }

    final set = <String>{};

    final linesList = text.splitIntoLines();

    final items = linesList.asMap().entries.map(
      (entry) {
        final spansList = entry.value.splitWithChars(config.chars);
        if (spansList.length > 1) {
          log('Line ${entry.key + 1}: ${entry.value}');
          log('len=${spansList.length}: $spansList');
        }
        if (spansList.length == 1) {
          return [
            TextSpan(text: entry.value, style: style),
            if (_ifNotLastLine(entry.key, linesList)) _emptyLine,
          ];
        } else {
          var index = 0;
          var acceptNext = true;
          String? commandsList;

          final items = spansList.map(
            (currentSpan) {
              log('========== $currentSpan ==========');
              commandsList = null; //TRY
              if (currentSpan.isEmpty) {
                if (index < entry.value.length) {
                  final marker = entry.value.substring(index, index + 1);
                  final item = marker.toggleMarker(
                    line: entry.value,
                    index: index,
                    context: context,
                    set: set,
                    commandsList: commandsList,
                    style: style,
                    acceptNext: acceptNext,
                  );
                  acceptNext = item.item2;
                  index++;
                  return [if (item.item1 != null) item.item1!];
                }
                return <TextSpan>[];
              } else {
                final adv = currentSpan.length;
                if (currentSpan[0] == '{') {
                  log('link: $currentSpan');
                  final close = currentSpan.indexOf('}');
                  if (close > 0) {
                    commandsList = currentSpan.substring(1, close);
                    log('AAA commandsList=$commandsList');
                    currentSpan = currentSpan.substring(close + 1);
                    log('remaining: $currentSpan');
                  }
                }
                final item = currentSpan.wrap(
                  context: context,
                  set: set,
                  commandsList: commandsList,
                  style: style,
                );
                index += adv;
                final TextSpan? toggled;
                if (index < entry.value.length) {
                  final marker = entry.value.substring(index, index + 1);
                  log('*** format: $marker');
                  final toggledMarker = marker.toggleMarker(
                    line: entry.value,
                    index: index,
                    context: context,
                    set: set,
                    commandsList: commandsList,
                    style: style,
                    acceptNext: acceptNext,
                  );
                  toggled = toggledMarker.item1;
                  acceptNext = toggledMarker.item2;
                  index++;
                } else {
                  toggled = null;
                }

                return [if (toggled != null) toggled, item];
              }
            },
          );

          if (!config.allowNonClosedTags && set.isNotEmpty) {
            throw SimpleRichTextError('not closed: $set');
          }
          return [
            ...items.flattened,
            if (_ifNotLastLine(entry.key, linesList)) _emptyLine,
          ];
        }
      },
    ).flattened;

    return [
      TextSpan(
        children: [
          if (config.appendParagraphNumber) ...[
            TextSpan(
              text: '\n${entry.key + 1} ',
              style: style.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            WidgetSpan(
              child: SizedBox(width: 0, height: entry.key > 0 ? 28 : 0),
            ),
          ],
          const WidgetSpan(child: SizedBox(width: 4)),
        ],
        style: style.copyWith(fontSize: 15),
      ),
      ...items,
    ];
  }

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  TextSpan get _emptyLine => const TextSpan(text: '\n');
}
