import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchable_term.freezed.dart';

@freezed
class SearchableTerm with _$SearchableTerm {
  const factory SearchableTerm.global(List<String> terms) = _Global;

  const factory SearchableTerm.localAllMatch(List<String> terms) = _LocalAllMatch;

  const factory SearchableTerm.localExactMatch(String term) = _LocalExactMatch;

  const factory SearchableTerm.none() = _None;
}
