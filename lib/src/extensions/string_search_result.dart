import '../../simple_rich_text.dart';

extension SearchResults on String {
  String get _char => SimpleRichTextMarkdown.filledCircle.rawValue;

  String highlightSearchResult(SearchableTerm term) {
    final lines = split(_char).map((e) => e.startsWith('{backgroundColor') ? '$_char$e$_char' : e);

    return term.when(
      wholeWordsMatches: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms, exactMatch: true)).join(),
      partialWordsMatches: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms, exactMatch: false)).join(),
      exactMatch: (term) => lines.map((e) => e.highlightExactMathFor(term.trim())).join(),
      navigateOnly: () => '^{navAnchor:nav_anchor}^$this',
      none: () => this,
    );
  }
}

extension on String {
  String highlightAllMatchedWordFor(List<String> terms, {required bool exactMatch}) {
    final updatedTerms = terms.map((e) => e.trim()).where((element) => element.length > 1).toSet().toList();

    if (updatedTerms.isEmpty) {
      return this;
    }

    final markdownChars = SimpleRichTextMarkdown.allChars;
    const punctuationChars = r'.,!?;:(){}\[\]<>„”…"“«»\-';
    final chars = '$punctuationChars$markdownChars';

    return replaceAllMapped(
      RegExp(
        updatedTerms
            .map(RegExp.escape)
            .map(
              (e) => !exactMatch || e.contains(r'\') ? e : '(?<=^|\\s|[$chars])$e(?=\\s|\$|[$chars])',
            )
            .join('|'),
        caseSensitive: false,
      ),
      (match) {
        final matchedWord = match.group(0)!;
        final result = '^{searchResult:search_result}$matchedWord^';

        return wrapWithHighlightsKeyword(matchedWord, result);
      },
    );
  }

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
