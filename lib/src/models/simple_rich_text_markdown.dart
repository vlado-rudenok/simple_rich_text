enum SimpleRichTextMarkdown {
  asterisk('*'),
  atSymbol('@'),
  backtick('`'),
  caret('^'),
  filledCircle('●'),
  percentageSign('%'),
  tilde('~');

  const SimpleRichTextMarkdown(this.rawValue);

  final String rawValue;

  static Iterable<String> get allCharsList => values.map((e) => e.rawValue);
  static String get allChars => allCharsList.join();
  static String get allCharsPattern => '[$allChars]';

  static String tapableBackgroundColor(String color, String id) => '{backgroundColor:$color;tap:$id}';
}
