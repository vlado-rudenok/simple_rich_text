library simple_rich_text;

import 'package:flutter/material.dart';

import 'simple_rich_text.dart';
import 'src/mixin/text_processing.dart';
import 'src/models/global_span.dart';

export 'src/models/searchable_term.dart';
export 'src/models/simple_rich_text_config.dart';
export 'src/models/simple_rich_text_markdown.dart';

/// Widget that renders a string with sub-string highlighting.
class SimpleRichText extends StatelessWidget with TextProcessing {
  const SimpleRichText({
    required this.text,
    required this.config,
    required this.style,
    this.leading,
    this.trailing,
    this.searchTerm = const SearchableTerm.none(),
    super.key,
    this.onUpdate,
    this.onParagraphUpdate,
    this.onTap,
  });

  /// The String to be displayed using rich text.
  final String text;
  final SearchableTerm searchTerm;
  final SimpleRichTextConfig config;
  final TextStyle style;
  final WidgetSpan? leading;
  final WidgetSpan? trailing;
  final void Function(List<GlobalKey>)? onUpdate;
  final void Function(List<(int, GlobalKey)>)? onParagraphUpdate;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    final formatted = processText(
      text,
      context,
      config: config,
      onTap: onTap,
      searchTerm: searchTerm,
      style: style,
    );
    final children = [
      if (config.textIndent > 0)
        WidgetSpan(
          child: SizedBox(
            width: config.textIndent,
            // Workaround: When text is wrapped with SelectionArea,
            // first line has incorrect selection position
            child: const Text(''),
          ),
        ),
      if (leading != null) leading!,
      ...formatted,
      if (trailing != null) trailing!,
    ];

    onUpdate?.call(
      children
          .whereType<GlobalSpan>()
          .map((e) => e.globalKey)
          .whereType<ExtendedGlobalKey>()
          .where((element) => element.paragraph == null)
          .map((e) => e.key)
          .toList(),
    );

    onParagraphUpdate?.call(
      children
          .whereType<GlobalSpan>()
          .map((e) => e.globalKey)
          .whereType<ExtendedGlobalKey>()
          .where((element) => element.paragraph != null)
          .map((e) => (e.paragraph ?? 0, e.key))
          .toList(),
    );

    final textSpan = TextSpan(children: children);

    final textWidget = Text.rich(
      textSpan,
      maxLines: config.maxLines,
      textAlign: config.textAlign ?? TextAlign.justify,
      textScaler: config.textScaleFactor != null ? TextScaler.linear(config.textScaleFactor!) : TextScaler.noScaling,
    );

    return textWidget;
  }
}
