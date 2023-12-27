import '../../simple_rich_text.dart';

extension SearchResults on String {
  String get _char => SimpleRichTextMarkdown.filledCircle.rawValue;

  String highlightSearchResult(SearchableTerm term) {
    final lines = split(_char).map((e) => e.startsWith('{tap') ? '$_char$e$_char' : e);

    return term.when(
      global: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms)).join(),
      localAllMatch: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms)).join(),
      localExactMatch: (terms) => lines.map((e) => e.highlightExactMathFor(terms)).join(),
      none: () => this,
    );
  }
}

extension on String {
  String highlightAllMatchedWordFor(List<String> terms) => replaceAllMapped(
        RegExp(
          terms.map(RegExp.escape).map((e) => e.contains(r'\') ? e : '\\b$e\\b').join('|'),
          caseSensitive: false,
        ),
        (match) {
          final matchedWord = match.group(0)!;
          final result = '^{searchResult:search_result}$matchedWord^';

          return wrapWithHighlightsKeyword(matchedWord, result);
        },
      );

  String highlightExactMathFor(String term) =>
      replaceAllMapped(RegExp(RegExp.escape(term), caseSensitive: false), (match) {
        final matchedWord = match.group(0)!;
        final result = '^{searchResult:search_result}$matchedWord^';
        return wrapWithHighlightsKeyword(matchedWord, result);
      });

  String wrapWithHighlightsKeyword(String rawText, String wrappedText) {
    final keyword = RegExp(r'\{tap:.*}').firstMatch(this)?.group(0);

    if (keyword == null || !startsWith(_char)) {
      return wrappedText;
    }

    return '$_char$wrappedText$_char$keyword';
  }
}
