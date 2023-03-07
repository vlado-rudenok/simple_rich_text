library simple_rich_text;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'src/colors.dart';
import 'src/commands.dart';
import 'src/commands_handler.dart';
import 'src/error.dart';
import 'src/extensions.dart';

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

    final linesList = _splitTextIntoLines();

    final items = linesList.asMap().entries.map(
      (entry) {
        final spansList = _splitLineIntoArray(entry.value);
        log('Line ${entry.key + 1}: ${entry.value}');
        log('len=${spansList.length}: $spansList');

        if (spansList.length == 1) {
          return [
            TextSpan(text: entry.value, style: style),
            if (_ifNotLastLine(entry.key, linesList)) _emptyLine,
          ];
        } else {
          var index = 0;
          var acceptNext = true;
          String? commandsList;

          TextSpan wrap(String value) {
            log('wrap: $value set=$set');

            final Map<String, String> map = {
              if (commandsList != null) ..._parseCommands(commandsList!),
            };

            final textStyle = _prepareStyle(map, set, map.parseDecorationStyle());
            log('attributes: $map');

            if (_mapContainsCommands(map)) {
              return TextSpan(
                text: value,
                // Beware!  This class is only safe because the TapGestureRecognizer is not given a deadline and therefore never allocates any resources.
                // In any other situation -- setting a deadline, using any of the less trivial recognizers, etc -- you would have to manage the gesture recognizer's lifetime
                // and call dispose() when the TextSpan was no longer being rendered.
                // Since TextSpan itself is @immutable, this means that you would have to manage the recognizer from outside
                // the TextSpan, e.g. in the State of a stateful widget that then hands the recognizer to the TextSpan.
                recognizer: TapGestureRecognizer()
                  ..onTap = () => CommandHandler.handleTap(
                        caption: value,
                        map: map,
                        context: context,
                        log: log,
                      ),
                style: textStyle,
              );
            } else {
              return TextSpan(text: value, style: textStyle);
            }
          }

          void toggle(String m) {
            if (m == r'\') {
              final c = entry.value.substring(index + 1, index + 2);
              log('quote: index=$index: $c');
              wrap(c);
              acceptNext = false;
            } else {
              if (acceptNext) {
                if (set.contains(m)) {
                  log('REM: $m');
                  set.remove(m);
                } else {
                  log('ADD: $m');
                  set.add(m);
                }
              }

              acceptNext = true;
            }
          }

          final items = spansList.map(
            (currentSpan) {
              log('========== $currentSpan ==========');
              commandsList = null; //TRY
              if (currentSpan.isEmpty) {
                if (index < entry.value.length) {
                  final m = entry.value.substring(index, index + 1);
                  toggle(m);
                  index++;
                }
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
                final item = wrap(currentSpan);
                index += adv;
                if (index < entry.value.length) {
                  final m = entry.value.substring(index, index + 1);
                  log('*** format: $m');
                  toggle(m);
                  index++;
                }

                return item;
              }
            },
          ).whereType<TextSpan>();

          if (!allowNonClosedTags && set.isNotEmpty) {
            throw SimpleRichTextError('not closed: $set');
          }

          return [
            ...items,
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

  TextStyle _prepareStyle(Map<String, String> map, Set<String> set, TextDecorationStyle? textDecorationStyle) {
    final textStyle = style.copyWith(
      color: map.containsKey('color') ? parseColor(map['color']!) : style.color,
      decoration: set.contains('_') ? TextDecoration.underline : TextDecoration.none,
      fontStyle: set.contains('/') ? FontStyle.italic : FontStyle.normal,
      fontWeight: set.contains('*') ? FontWeight.bold : FontWeight.normal,
      fontSize: map.containsKey('fontSize') ? double.parse(map['fontSize']!) : style.fontSize,
      fontFamily: map.containsKey('fontFamily') ? '${map['fontFamily']}' : style.fontFamily,
      backgroundColor:
          map.containsKey('backgroundColor') ? parseColor(map['backgroundColor']!) : style.backgroundColor,
      decorationColor:
          map.containsKey('decorationColor') ? parseColor(map['decorationColor']!) : style.decorationColor,
      decorationStyle: textDecorationStyle ?? style.decorationStyle,
      decorationThickness: map.containsKey('decorationThickness')
          ? double.parse(map['decorationThickness']!)
          : style.decorationThickness,
      height: map.containsKey('height') ? double.parse(map['height']!) : style.height,
      letterSpacing: map.containsKey('letterSpacing') ? double.parse(map['letterSpacing']!) : style.letterSpacing,
      wordSpacing: map.containsKey('wordSpacing') ? double.parse(map['wordSpacing']!) : style.wordSpacing,
    );
    return textStyle;
  }

  bool _mapContainsCommands(Map<String, String> map) =>
      map.containsKey(Commands.popRoute.rawValue) ||
      map.containsKey(Commands.pushRoute.rawValue) ||
      map.containsKey(Commands.replaceRoute.rawValue) ||
      map.containsKey(Commands.openLink.rawValue);

  Map<String, String> _parseCommands(String commandsList) {
    final pairs = commandsList.split(';').map((e) => e.split(':'));

    if (pairs.any((element) => element.length != 2)) {
      throw const SimpleRichTextError(
        'attribute value is missing a value (e.g., you passed {key} but not {key:value}',
      );
    }

    return {
      for (var pair in pairs)
        if (pair.length == 2) pair.first.trim(): pair.last.trim()
    };
  }

  List<String> _splitTextIntoLines() {
    final containsNewLine = text.contains(r'\n');
    log('Contains new line: $containsNewLine');

    final list = [if (containsNewLine) ...text.split(r'\n'), if (!containsNewLine) text];
    log('lines=${list.length}: $list');

    return list;
  }

  List<String> _splitLineIntoArray(String line) => line.split(RegExp(chars ?? r'[*~/_\\]'));

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  TextSpan get _emptyLine => const TextSpan(text: '\n');

  void log(String s) {
    if (kDebugMode) {
      print('simple_rich_text: $s');
    }
  }
}
