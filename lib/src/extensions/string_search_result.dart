import '../../simple_rich_text.dart';

extension SearchResults on String {
  String get _char => SimpleRichTextMarkdown.filledCircle.rawValue;

  String highlightSearchResult(SearchableTerm term) {
    final lines = split(_char).map((e) => e.startsWith('{backgroundColor') ? '$_char$e$_char' : e);

    return term.when(
      wholeWordsMatches: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms, exactMatch: true)).join(),
      partialWordsMatches: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms, exactMatch: false)).join(),
      exactMatch: (terms) => lines.map((e) => e.highlightExactMathFor(terms)).join(),
      navigateOnly: () => '^{navAnchor:nav_anchor}^$this',
      none: () => this,
    );
  }
}

extension on String {
  String highlightAllMatchedWordFor(List<String> terms, {required bool exactMatch}) => replaceAllMapped(
        RegExp(
          terms.map(RegExp.escape).map((e) => !exactMatch || e.contains(r'\') ? e : '\\b$e\\b').join('|'),
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
    final keyword = RegExp(r'\{backgroundColor:.*}').firstMatch(this)?.group(0);

    if (keyword == null || !startsWith(_char)) {
      return wrappedText;
    }

    return '$_char$wrappedText$_char$keyword';
  }
}
