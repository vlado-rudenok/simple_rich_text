import '../../simple_rich_text.dart';

extension SearchResults on String {
  String get _char => SimpleRichTextMarkdown.filledCircle.rawValue;

  String highlightSearchResult(SearchableTerm term) {
    final lines = split(_char).map((e) => e.startsWith('{backgroundColor') ? '$_char$e$_char' : e);

    return term.when(
      matchTerms: (terms) => lines.map((e) => e.highlightAllMatchedWordFor(terms)).join(),
      navigateOnly: () => '^{navAnchor:nav_anchor}^$this',
      none: () => this,
    );
  }
}

extension on String {
  String highlightAllMatchedWordFor(List<String> terms) {
    final updatedTerms = terms.map((e) => e.trim()).where((element) => element.isNotEmpty).toSet().toList();

    if (updatedTerms.isEmpty) {
      return this;
    }

    return replaceAllMapped(
      RegExp(
        updatedTerms.map(RegExp.escape).join('|'),
        caseSensitive: false,
      ),
      (match) {
        final matchedWord = match.group(0)!;
        final result = '^{searchResult:search_result}$matchedWord^';

        return wrapWithHighlightsKeyword(matchedWord, result);
      },
    );
  }

  String wrapWithHighlightsKeyword(String rawText, String wrappedText) {
    final keyword = RegExp(r'\{backgroundColor:.*}').firstMatch(this)?.group(0);

    if (keyword == null || !startsWith(_char)) {
      return wrappedText;
    }

    return '$_char$wrappedText$_char$keyword';
  }
}
