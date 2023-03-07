library simple_rich_text;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'src/colors.dart';
import 'src/commands.dart';
import 'src/commands_handler.dart';
import 'src/error.dart';

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
  final TextStyle? style;

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

    final children = <InlineSpan>[];

    if (leadingText != null) {
      children.add(leadingText!);
    }

    final set = <String>{};

    final linesList = _splitTextIntoLines();

    // Apply modifications into all lines
    for (int lineIndex = 0; lineIndex < linesList.length; lineIndex++) {
      log('Line ${lineIndex + 1}: ${linesList[lineIndex]}');
      final spansList = _splitLineIntoArray(linesList, lineIndex);
      log('len=${spansList.length}: $spansList');

      if (_isTrivial(spansList)) {
        _handleTrivial(children, lineIndex, linesList);
      } else {
        int index = 0;
        bool acceptNext = true;
        String? commandsList;

        void wrap(String value) {
          log('wrap: $value set=$set');

          final Map<String, String> map = {};

          if (commandsList != null) {
            _addCommandsToMap(commandsList, map);
          }

          final textDecorationStyle = _prepareTextDecoration(map);
          final textStyle = _prepareStyle(map, set, textDecorationStyle);

          if (_mapContainsCommands(map)) {
            children.add(
              TextSpan(
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
              ),
            );
          } else {
            children.add(TextSpan(text: value, style: textStyle));
          }
        }

        void toggle(String m) {
          if (m == r'\') {
            final c = linesList[lineIndex].substring(index + 1, index + 2);
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

        for (var currentSpan in spansList) {
          log('========== $currentSpan ==========');
          commandsList = null; //TRY
          if (currentSpan.isEmpty) {
            if (index < linesList[lineIndex].length) {
              final m = linesList[lineIndex].substring(index, index + 1);
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
            wrap(currentSpan);
            index += adv;
            if (index < linesList[lineIndex].length) {
              final m = linesList[lineIndex].substring(index, index + 1);
              log('*** format: $m');
              toggle(m);
              index++;
            }
          }
        }

        if (!allowNonClosedTags && set.isNotEmpty) {
          throw SimpleRichTextError('not closed: $set');
        }

        _addEmptyLineIfNeeded(lineIndex, linesList, children);
      }
    }

    if (trailingText != null) {
      children.add(trailingText!);
    }

    return RichText(
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.clip,
      text: TextSpan(children: children),
      textAlign: textAlign ?? TextAlign.start,
      textScaleFactor: textScaleFactor ?? MediaQuery.of(context).textScaleFactor,
    );
  }

  TextStyle _prepareStyle(Map<String, String> map, Set<String> set, TextDecorationStyle? textDecorationStyle) {
    final textStyle = style!.copyWith(
      color: map.containsKey('color') ? parseColor(map['color']!) : style!.color,
      decoration: set.contains('_') ? TextDecoration.underline : TextDecoration.none,
      fontStyle: set.contains('/') ? FontStyle.italic : FontStyle.normal,
      fontWeight: set.contains('*') ? FontWeight.bold : FontWeight.normal,
      fontSize: map.containsKey('fontSize') ? double.parse(map['fontSize']!) : style!.fontSize,
      fontFamily: map.containsKey('fontFamily') ? '${map['fontFamily']}' : style!.fontFamily,
      backgroundColor:
          map.containsKey('backgroundColor') ? parseColor(map['backgroundColor']!) : style!.backgroundColor,
      decorationColor:
          map.containsKey('decorationColor') ? parseColor(map['decorationColor']!) : style!.decorationColor,
      decorationStyle: textDecorationStyle ?? style!.decorationStyle,
      decorationThickness: map.containsKey('decorationThickness')
          ? double.parse(map['decorationThickness']!)
          : style!.decorationThickness,
      height: map.containsKey('height') ? double.parse(map['height']!) : style!.height,
      letterSpacing: map.containsKey('letterSpacing') ? double.parse(map['letterSpacing']!) : style!.letterSpacing,
      wordSpacing: map.containsKey('wordSpacing') ? double.parse(map['wordSpacing']!) : style!.wordSpacing,
    );
    return textStyle;
  }

  bool _mapContainsCommands(Map<String, String> map) =>
      map.containsKey(Commands.popRoute.rawValue) ||
      map.containsKey(Commands.pushRoute.rawValue) ||
      map.containsKey(Commands.replaceRoute.rawValue) ||
      map.containsKey(Commands.openLink.rawValue);

  TextDecorationStyle? _prepareTextDecoration(Map<String, String> map) {
    TextDecorationStyle? textDecorationStyle;
    if (map.containsKey('decorationStyle')) {
      if (map['decorationStyle'] == 'dashed') {
        textDecorationStyle = TextDecorationStyle.dashed;
      }
      if (map['decorationStyle'] == 'double') {
        textDecorationStyle = TextDecorationStyle.double;
      }
      if (map['decorationStyle'] == 'dotted') {
        textDecorationStyle = TextDecorationStyle.dotted;
      }
      if (map['decorationStyle'] == 'solid') {
        textDecorationStyle = TextDecorationStyle.solid;
      }
      if (map['decorationStyle'] == 'wavy') {
        textDecorationStyle = TextDecorationStyle.wavy;
      }
    }
    return textDecorationStyle;
  }

  void _addCommandsToMap(String commandsList, Map<String, String> map) {
    final pairs = commandsList.split(';');
    for (final pair in pairs) {
      final a = pair.split(':');
      if (a.length == 2) {
        map[a[0].trim()] = a[1].trim();
      } else {
        throw const SimpleRichTextError(
          'attribute value is missing a value (e.g., you passed {key} but not {key:value}',
        );
      }
    }
    log('attributes: $map');
  }

  void _handleTrivial(List<InlineSpan> children, int k, List<String> linesList) {
    log('trivial');
    if (style == null) {
      children.add(const TextSpan(text: ''));
      _addEmptyLineIfNeeded(k, linesList, children);
    } else {
      children.add(TextSpan(text: linesList[k], style: style));
      _addEmptyLineIfNeeded(k, linesList, children);
    }
  }

  bool _isTrivial(List<String> spanList) => spanList.length == 1;

  List<String> _splitTextIntoLines() {
    final containsNewLine = text.contains(r'\n');
    log('Contains new line: $containsNewLine');
    List<String> linesList = [];
    if (containsNewLine) {
      linesList = text.split(r'\n');
      log('lines=${linesList.length}: $linesList');
    } else {
      linesList.add(text);
    }
    return linesList;
  }

  List<String> _splitLineIntoArray(List<String> linesList, int k) => linesList[k].split(RegExp(chars ?? r'[*~/_\\]'));

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  void _addEmptyLineIfNeeded(int k, List<String> linesList, List<InlineSpan> children) {
    if (_ifNotLastLine(k, linesList)) {
      children.add(const TextSpan(text: '\n'));
    }
  }

  void log(String s) {
    if (kDebugMode) {
      print('simple_rich_text: $s');
    }
  }
}
