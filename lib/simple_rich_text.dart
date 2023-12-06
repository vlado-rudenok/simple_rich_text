library simple_rich_text;

import 'package:flutter/material.dart';

import 'simple_rich_text.dart';
import 'src/models/global_span.dart';
import 'src/mixin/text_processing.dart';

export 'src/models/simple_rich_text_config.dart';
export 'src/models/simple_rich_text_markdown.dart';
export 'src/models/search_term.dart';

/// Widget that renders a string with sub-string highlighting.
class SimpleRichText extends StatelessWidget with TextProcessing {
  const SimpleRichText({
    required this.text,
    required this.config,
    required this.style,
    super.key,
    this.onUpdate,
    this.searchTerm,
    this.onTap,
  });

  /// The String to be displayed using rich text.
  final String text;
  final Object? searchTerm;
  final SimpleRichTextConfig config;
  final TextStyle style;
  final void Function(List<GlobalKey>)? onUpdate;
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
      if (config.textIndent > 0) WidgetSpan(child: SizedBox(width: config.textIndent)),
      ...formatted,
    ];

    onUpdate?.call(children.whereType<GlobalSpan>().map((e) => e.globalKey).whereType<GlobalKey>().toList());

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
