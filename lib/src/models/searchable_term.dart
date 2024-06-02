import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_term.freezed.dart';

@freezed
class SearchableTerm with _$SearchableTerm {
  const factory SearchableTerm.partialWordsMatches(List<String> terms) = _PartialWordsMatches;

  const factory SearchableTerm.exactMatch(String term) = _ExactMatch;

  const factory SearchableTerm.navigateOnly() = _NavigateOnly;

  const factory SearchableTerm.none() = _None;
}
