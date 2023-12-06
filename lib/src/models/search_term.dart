abstract interface class SearchTerm<T> {
  T get term;
  String get line;
}

class GlobalSearchTerm implements SearchTerm<List<String>> {
  GlobalSearchTerm({
    required this.term,
    required this.line,
  });

  @override
  final List<String> term;

  @override
  final String line;
}

class LocalAllMatchTerm implements SearchTerm<List<String>> {
  LocalAllMatchTerm(this.term);

  @override
  String get line => '';

  @override
  final List<String> term;
}

class LocalExactMatchTerm implements SearchTerm<String> {
  LocalExactMatchTerm(this.term);

  @override
  String get line => '';

  @override
  final String term;
}
