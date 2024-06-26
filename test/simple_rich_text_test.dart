import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

// https://flutter.dev/docs/cookbook/testing/widget/introduction#3-create-a-testwidgets-test

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('test the thing!', (tester) async {
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
}
