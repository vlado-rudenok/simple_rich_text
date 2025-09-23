import 'package:flutter/material.dart';

class SimpleRichTextConfig {
  SimpleRichTextConfig({
    this.allowNonClosedTags = false,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.textScaleFactor,
    this.textIndent = 0,
    this.autoSizeEnabled = false,
  });

  final double? textScaleFactor;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool autoSizeEnabled;

  /// allow non-closed tags (e.g., "this is *bold" because no closing * character), otherwise exception is thrown
  final bool allowNonClosedTags;
  final double textIndent;
}
