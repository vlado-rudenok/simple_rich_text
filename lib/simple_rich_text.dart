library simple_rich_text;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'src/error.dart';
import 'src/extensions_string.dart';
import 'src/logger.dart';

/// Widget that renders a string with sub-string highlighting.
class SimpleRichText extends StatelessWidget {
  const SimpleRichText(
    this.text, {
    super.key,
    this.chars,
    this.allowNonClosedTags = false,
    this.maxLines,
    this.leadingText,
    this.trailingText,
    this.style = const TextStyle(),
    this.textAlign,
    this.textOverflow,
    this.textScaleFactor,
  });

  /// User-defined chars, default chars set is [*~/_\\]
  final String? chars;

  /// allow non-closed tags (e.g., "this is *bold" because no closing * character), otherwise exception is thrown
  final bool allowNonClosedTags;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to overflow.
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  final int? maxLines;

  /// optional leading TextSpan
  final TextSpan? leadingText;

  /// optional trailing TextSpan
  final TextSpan? trailingText;

  /// The {TextStyle} of the {SimpleRichText.text} that isn't highlighted.
  final TextStyle style;

  /// The String to be displayed using rich text.
  final String text;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? textOverflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  final double? textScaleFactor;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const Text('');
    }

    final set = <String>{};

    final linesList = text.splitIntoLines();

    final items = linesList.asMap().entries.map(
      (entry) {
        final spansList = entry.value.splitWithChars(chars);
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

          if (!allowNonClosedTags && set.isNotEmpty) {
            throw SimpleRichTextError('not closed: $set');
          }
          return [
            ...items.flattened,
            if (_ifNotLastLine(entry.key, linesList)) _emptyLine,
          ];
        }
      },
    ).flattened;

    final children = <InlineSpan>[
      if (leadingText != null) leadingText!,
      ...items,
      if (trailingText != null) trailingText!,
    ];

    return RichText(
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.clip,
      text: TextSpan(children: children),
      textAlign: textAlign ?? TextAlign.start,
      textScaleFactor: textScaleFactor ?? MediaQuery.of(context).textScaleFactor,
    );
  }

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  TextSpan get _emptyLine => const TextSpan(text: '\n');
}
