import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:simple_rich_text/src/extensions/string_search_result.dart';

void main() {
  group('whole-word search highlighting', () {
    test('does not highlight in inside fine or morning', () {
      const text = 'fine morning';
      final highlighted = text.highlightSearchResult(
        SearchableTerm.matchAnyTerms(['in']),
      );

      expect(highlighted, text);
      expect(highlighted.contains('searchResult'), isFalse);
    });

    test('highlights contiguous phrase Jesus in only', () {
      const text = 'Jesus in the morning';
      final highlighted = text.highlightSearchResult(
        SearchableTerm.matchAnyTerms(['Jesus in']),
      );

      expect(
        highlighted,
        '^{searchResult:search_result}Jesus in^ the morning',
      );
    });

    test('highlights Jesus and standalone in but not inside fine or morning', () {
      const text = 'Jesus in the fine morning';
      final highlighted = text.highlightSearchResult(
        SearchableTerm.matchAnyTerms(['Jesus', 'in']),
      );

      expect(
        highlighted,
        '^{searchResult:search_result}Jesus^ ^{searchResult:search_result}in^ the fine morning',
      );
    });

    test('Russian short token does not highlight inside a longer word', () {
      // "на" is a substring of "она"; letter boundaries must skip it (unlike ASCII \b).
      const text = 'она на берегу';
      final highlighted = text.highlightSearchResult(
        SearchableTerm.matchAnyTerms(['на']),
      );

      expect(
        highlighted,
        'она ^{searchResult:search_result}на^ берегу',
      );
    });
  });

  testWidgets('search highlight paints whole-word matches only', (tester) async {
    TextSpan? generated;
    const searchResultColor = Color(0xFFECC950);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: SimpleRichText(
          text: 'Jesus in the fine morning',
          style: const TextStyle(color: Colors.black),
          config: SimpleRichTextConfig(),
          searchTerm: SearchableTerm.matchAnyTerms(['Jesus', 'in']),
          onTextGenerated: (span) => generated = span,
        ),
      ),
    );

    expect(generated, isNotNull);
    final highlighted = _collectSpans(generated!)
        .where((s) => s.style?.backgroundColor == searchResultColor)
        .map((s) => s.text)
        .join('|');
    expect(highlighted, 'Jesus|in');
  });
}

Iterable<TextSpan> _collectSpans(TextSpan root) sync* {
  if (root.text != null) {
    yield root;
  }
  final children = root.children;
  if (children == null) {
    return;
  }
  for (final child in children) {
    if (child is TextSpan) {
      yield* _collectSpans(child);
    }
  }
}
