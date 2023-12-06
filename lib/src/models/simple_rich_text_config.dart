import 'package:flutter/material.dart';

class SimpleRichTextConfig {
  SimpleRichTextConfig({
    this.allowNonClosedTags = false,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.textScaleFactor,
    this.textIndent = 0,
  });

  final double? textScaleFactor;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  /// allow non-closed tags (e.g., "this is *bold" because no closing * character), otherwise exception is thrown
  final bool allowNonClosedTags;
  final double textIndent;
}
