class SimpleRichTextError implements Exception {
  const SimpleRichTextError(this.message);
  final String message;

  @override
  String toString() => 'SimpleRichTextError: $message';
}
