class SearchableTerm {
  const SearchableTerm._(this.terms, this.type);

  const SearchableTerm.navigateOnly() : this._(null, SearchableTermType.navigateOnly);

  const SearchableTerm.none() : this._(null, SearchableTermType.none);

  factory SearchableTerm.matchAllTerms(List<String> terms) =>
      SearchableTerm._(terms, SearchableTermType.matchAllTerms);

  factory SearchableTerm.matchAnyTerms(List<String> terms) =>
      SearchableTerm._(terms, SearchableTermType.matchAnyTerms);

  final List<String>? terms;
  final SearchableTermType type;
}

enum SearchableTermType { matchAllTerms, matchAnyTerms, navigateOnly, none }
