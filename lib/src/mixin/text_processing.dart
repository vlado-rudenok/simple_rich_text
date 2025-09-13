import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import '../../simple_rich_text.dart';
import '../error.dart';
import '../extensions/string_search_result.dart';
import '../extensions_string.dart';
import '../logger.dart';

mixin TextProcessing {
  Iterable<TextSpan> processText(
    String textToProcess,
    BuildContext context, {
    required SearchableTerm searchTerm,
    required SimpleRichTextConfig config,
    required TextStyle style,
    required void Function(String)? onTap,
  }) {
    if (textToProcess.isEmpty) {
      return [const TextSpan()];
    }

    final text = textToProcess.highlightSearchResult(searchTerm);

    final set = <String>{};

    final linesList = text.splitIntoLines();

    final items = linesList.asMap().entries.map((entry) {
      final spansList = entry.value.splitWithChars(SimpleRichTextMarkdown.allCharsPattern);
      if (spansList.length == 1) {
        return [
          TextSpan(text: entry.value, style: style),
          if (_ifNotLastLine(entry.key, linesList)) _emptyLine,
        ];
      } else {
        var index = 0;
        var acceptNext = true;
        String? commandsList;

        final items = spansList.map((currentSpan) {
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
                onTap: onTap,
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
              onTap: onTap,
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
                onTap: onTap,
              );
              toggled = toggledMarker.$1;
              acceptNext = toggledMarker.$2;
              index++;
            } else {
              toggled = null;
            }

            return [if (toggled != null) toggled, item];
          }
        });

        if (!config.allowNonClosedTags && set.isNotEmpty) {
          throw SimpleRichTextError('not closed: $set');
        }
        return [...items.flattened, if (_ifNotLastLine(entry.key, linesList)) _emptyLine];
      }
    }).flattened;

    return items;
  }

  bool _ifNotLastLine(int k, List<String> linesList) => k < linesList.length - 1;

  TextSpan get _emptyLine => const TextSpan(text: '\n');
}
