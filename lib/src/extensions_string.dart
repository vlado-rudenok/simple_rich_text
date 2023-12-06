import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'commands_handler.dart';
import 'error.dart';
import 'extensions_map.dart';
import 'global_span.dart';
import 'logger.dart';

extension Splitable on String {
  List<String> splitWithChars(String chars) => split(RegExp(chars));

  List<String> splitIntoLines() {
    final containsNewLine = contains(r'\n');
    if (containsNewLine) {
      log('Contains new line: $containsNewLine');
    }
    final list = [if (containsNewLine) ...split(r'\n'), if (!containsNewLine) this];

    if (list.length > 1) {
      log('lines=${list.length}: $list');
    }
    return list;
  }

  TextSpan wrap({
    required BuildContext context,
    required Set<String> set,
    required String? commandsList,
    required TextStyle style,
    required void Function(String)? onTap,
  }) {
    log('wrap: $this set=$set');

    final map = <String, String>{
      if (commandsList != null) ..._parseCommands(commandsList),
    };

    final textStyle = _prepareStyle(
      map,
      set,
      map.parseDecorationStyle(),
      style,
    );
    log('attributes: $map');

    if (map.containsCommands()) {
      return TextSpan(
        text: this,
        // Beware!  This class is only safe because the TapGestureRecognizer is not given a deadline and therefore never allocates any resources.
        // In any other situation -- setting a deadline, using any of the less trivial recognizers, etc -- you would have to manage the gesture recognizer's lifetime
        // and call dispose() when the TextSpan was no longer being rendered.
        // Since TextSpan itself is @immutable, this means that you would have to manage the recognizer from outside
        // the TextSpan, e.g. in the State of a stateful widget that then hands the recognizer to the TextSpan.
        recognizer: TapGestureRecognizer()
          ..onTap = () async => CommandHandler.handleTap(
                caption: this,
                map: map,
                context: context,
                onTap: onTap,
              ),
        style: textStyle,
      );
    } else {
      return GlobalSpan(
        globalKey: map.containsKey('searchResult') ? GlobalKey() : null,
        child: TextSpan(
          text: this,
          style: textStyle,
        ),
      );
    }
  }

  (TextSpan?, bool) toggleMarker({
    required String line,
    required int index,
    required BuildContext context,
    required Set<String> set,
    required String? commandsList,
    required TextStyle style,
    required bool acceptNext,
    required void Function(String)? onTap,
  }) {
    if (this == r'\') {
      final c = line.substring(index + 1, index + 2);
      log('quote: index=$index: $c');
      final item = c.wrap(
        context: context,
        set: set,
        commandsList: commandsList,
        style: style,
        onTap: onTap,
      );
      return (item, false);
    } else {
      if (acceptNext) {
        if (set.contains(this)) {
          log('REM: $this');
          set.remove(this);
        } else {
          log('ADD: $this');
          set.add(this);
        }
      }

      return const (null, true);
    }
  }

  Map<String, String> _parseCommands(String commandsList) {
    final pairs = commandsList.split(';').map((e) => e.split(':'));

    if (pairs.any((element) => element.length != 2)) {
      throw const SimpleRichTextError(
        'attribute value is missing a value (e.g., you passed {key} but not {key:value}',
      );
    }

    return {
      for (final pair in pairs)
        if (pair.length == 2) pair.first.trim(): pair.last.trim(),
    };
  }

  TextStyle _prepareStyle(
    Map<String, String> map,
    Set<String> set,
    TextDecorationStyle? textDecorationStyle,
    TextStyle style,
  ) {
    final textStyle = style.copyWith(
      color: map.containsKey('searchResult')
          ? Colors.black
          : map.containsKey('color')
              ? parseColor(map['color']!)
              : (set.contains('`') || set.contains('@'))
                  ? Colors.grey
                  : style.color,
      decoration: set.contains('_') ? TextDecoration.underline : TextDecoration.none,
      fontStyle: set.contains('^') || set.contains('%') ? FontStyle.italic : FontStyle.normal,
      fontWeight: set.contains('*')
          ? set.contains('~')
              ? FontWeight.normal
              : FontWeight.bold
          : FontWeight.normal,
      fontSize: map.containsKey('fontSize') ? double.parse(map['fontSize']!) : style.fontSize,
      fontFamily: map.containsKey('fontFamily') ? '${map['fontFamily']}' : style.fontFamily,
      backgroundColor: map.containsKey('searchResult')
          ? parseColor(map['searchResult']!)
          : map.containsKey('backgroundColor')
              ? parseColor(map['backgroundColor']!)
              : style.backgroundColor,
      decorationColor: map.containsKey('decorationColor') ? parseColor(map['decorationColor']!) : style.decorationColor,
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

  String highlightAllMatchedWordFor({
    required List<String> terms,
  }) =>
      replaceAllMapped(
        RegExp(
          terms.map(RegExp.escape).map((e) => e.contains(r'\') ? e : '\\b$e\\b').join('|'),
          caseSensitive: false,
        ),
        (match) {
          final matchedWord = match.group(0)!;
          return '^{searchResult:search_result}$matchedWord^';
        },
      );

  String highlightExactMathFor(String term) => replaceAllMapped(
        RegExp(RegExp.escape(term), caseSensitive: false),
        (match) => '^{searchResult:search_result}${match.group(0)}^',
      );
}
