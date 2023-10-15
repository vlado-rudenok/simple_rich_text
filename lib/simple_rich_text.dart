library simple_rich_text;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

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

class SimpleRichTextConfig {
  SimpleRichTextConfig({
    this.allowNonClosedTags = false,
    this.chars,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.textScaleFactor,
  });
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
class SimpleRichText extends StatelessWidget {
  const SimpleRichText({
    required this.text,
    required this.config,
    required this.style,
    super.key,
    this.onUpdate,
    this.globalSearchTerm,
    this.leadingText,
    this.searchTerms = const [],
    this.trailingText,
  });

  /// controller for search
  final GlobalSearchTerm? globalSearchTerm;

  /// optional leading TextSpan
  final TextSpan? leadingText;

  /// optional trailing TextSpan
  final TextSpan? trailingText;

  /// The String to be displayed using rich text.
  final String text;
  final List<String> searchTerms;
  final SimpleRichTextConfig config;
  final TextStyle style;
  final void Function(List<GlobalKey>)? onUpdate;

  @override
  Widget build(BuildContext context) {
    final formatted = _prepareText(text, context);
    final children = [
      if (leadingText != null) leadingText!,
      ...formatted,
      if (trailingText != null) trailingText!,
    ];

    onUpdate?.call(children.whereType<GlobalSpan>().map((e) => e.globalKey).whereType<GlobalKey>().toList());

    final textSpan = TextSpan(children: children);

    final textWidget = Text.rich(
      textSpan,
      maxLines: config.maxLines,
      textAlign: config.textAlign ?? TextAlign.justify,
      textScaleFactor: config.textScaleFactor,
    );

    return textWidget;
  }

  Iterable<TextSpan> _prepareText(
    String entry,
    BuildContext context,
  ) {
    if (entry.isEmpty) {
      return [const TextSpan()];
    }

    String text;

    if (searchTerms.isEmpty && globalSearchTerm != null && entry.contains(globalSearchTerm!.line)) {
      final terms = globalSearchTerm?.searchTerms ?? [];
      text = entry.highlightAllSearchTerms(terms: terms);
    } else if (searchTerms.isNotEmpty) {
      text = entry.highlightAllSearchTerms(terms: searchTerms);
    } else {
      text = entry;
    }

    final set = <String>{};

    final linesList = text.splitIntoLines();

    final items = linesList.asMap().entries.map(
      (entry) {
        final spansList = entry.value.splitWithChars(config.chars);
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
                  acceptNext = item.$2;
                  index++;
                  return [if (item.$1 != null) item.$1!];
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
                  toggled = toggledMarker.$1;
                  acceptNext = toggledMarker.$2;
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

    return items;
  }

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  TextSpan get _emptyLine => const TextSpan(text: '\n');
}
