import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_term.freezed.dart';

@freezed
class SearchableTerm with _$SearchableTerm {
  const factory SearchableTerm.matchTerms(List<String> terms) = _WholeWordsMatches;

  const factory SearchableTerm.navigateOnly() = _NavigateOnly;

  const factory SearchableTerm.none() = _None;
}
