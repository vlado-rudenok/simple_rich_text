class SearchableTerm {
  const SearchableTerm._(this.terms, this.type, {this.wholeWord = true});

  const SearchableTerm.navigateOnly() : this._(null, SearchableTermType.navigateOnly);

  const SearchableTerm.none() : this._(null, SearchableTermType.none);

  factory SearchableTerm.matchAllTerms(List<String> terms, {bool wholeWord = true}) =>
      SearchableTerm._(terms, SearchableTermType.matchAllTerms, wholeWord: wholeWord);

  factory SearchableTerm.matchAnyTerms(List<String> terms, {bool wholeWord = true}) =>
      SearchableTerm._(terms, SearchableTermType.matchAnyTerms, wholeWord: wholeWord);

  final List<String>? terms;
  final SearchableTermType type;
  final bool wholeWord;
}

enum SearchableTermType { matchAllTerms, matchAnyTerms, navigateOnly, none }
