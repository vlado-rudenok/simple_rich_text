import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

void main() {
  testWidgets('bold marker renders', (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: SimpleRichText(
          text: 'This is *bold*',
          style: const TextStyle(),
          config: SimpleRichTextConfig(),
        ),
      ),
    );
  });

  testWidgets('rareSymbol uses configured color', (tester) async {
    TextSpan? generated;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: SimpleRichText(
          text: 'Say ■Hello■ world',
          style: const TextStyle(color: Colors.black),
          config: SimpleRichTextConfig(
            symbolColors: {MarkdownSymbol.rareSymbol.rawValue: Colors.red},
          ),
          onTextGenerated: (span) => generated = span,
        ),
      ),
    );

    expect(generated, isNotNull);
    final redSpans = _collectSpans(generated!).where((s) => s.style?.color == Colors.red);
    expect(redSpans.map((s) => s.text).join(), 'Hello');
    expect(find.textContaining('■'), findsNothing);
  });

  testWidgets('caret uses configured color and stays italic', (tester) async {
    TextSpan? generated;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: SimpleRichText(
          text: 'the ^added^ word',
          style: const TextStyle(color: Colors.black),
          config: SimpleRichTextConfig(
            symbolColors: {MarkdownSymbol.caret.rawValue: Colors.grey},
          ),
          onTextGenerated: (span) => generated = span,
        ),
      ),
    );

    expect(generated, isNotNull);
    final greySpans = _collectSpans(generated!).where((s) => s.style?.color == Colors.grey);
    expect(greySpans, isNotEmpty);
    expect(greySpans.every((s) => s.style?.fontStyle == FontStyle.italic), isTrue);
    expect(greySpans.map((s) => s.text).join(), 'added');
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
