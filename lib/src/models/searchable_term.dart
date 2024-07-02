import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_term.freezed.dart';

@freezed
class SearchableTerm with _$SearchableTerm {
  const factory SearchableTerm.matchAllTerms(List<String> terms) = _MatchAllTerms;

  const factory SearchableTerm.matchAnyTerms(List<String> terms) = _MatchAnyTerms;

  const factory SearchableTerm.navigateOnly() = _NavigateOnly;

  const factory SearchableTerm.none() = _None;
}
