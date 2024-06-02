// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchable_term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchableTerm {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) partialWordsMatches,
    required TResult Function(String term) exactMatch,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? partialWordsMatches,
    TResult? Function(String term)? exactMatch,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? partialWordsMatches,
    TResult Function(String term)? exactMatch,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PartialWordsMatches value) partialWordsMatches,
    required TResult Function(_ExactMatch value) exactMatch,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult? Function(_ExactMatch value)? exactMatch,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult Function(_ExactMatch value)? exactMatch,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchableTermCopyWith<$Res> {
  factory $SearchableTermCopyWith(
          SearchableTerm value, $Res Function(SearchableTerm) then) =
      _$SearchableTermCopyWithImpl<$Res, SearchableTerm>;
}

/// @nodoc
class _$SearchableTermCopyWithImpl<$Res, $Val extends SearchableTerm>
    implements $SearchableTermCopyWith<$Res> {
  _$SearchableTermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PartialWordsMatchesImplCopyWith<$Res> {
  factory _$$PartialWordsMatchesImplCopyWith(_$PartialWordsMatchesImpl value,
          $Res Function(_$PartialWordsMatchesImpl) then) =
      __$$PartialWordsMatchesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> terms});
}

/// @nodoc
class __$$PartialWordsMatchesImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$PartialWordsMatchesImpl>
    implements _$$PartialWordsMatchesImplCopyWith<$Res> {
  __$$PartialWordsMatchesImplCopyWithImpl(_$PartialWordsMatchesImpl _value,
      $Res Function(_$PartialWordsMatchesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$PartialWordsMatchesImpl(
      null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PartialWordsMatchesImpl implements _PartialWordsMatches {
  const _$PartialWordsMatchesImpl(final List<String> terms) : _terms = terms;

  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'SearchableTerm.partialWordsMatches(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartialWordsMatchesImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartialWordsMatchesImplCopyWith<_$PartialWordsMatchesImpl> get copyWith =>
      __$$PartialWordsMatchesImplCopyWithImpl<_$PartialWordsMatchesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) partialWordsMatches,
    required TResult Function(String term) exactMatch,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return partialWordsMatches(terms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? partialWordsMatches,
    TResult? Function(String term)? exactMatch,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return partialWordsMatches?.call(terms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? partialWordsMatches,
    TResult Function(String term)? exactMatch,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (partialWordsMatches != null) {
      return partialWordsMatches(terms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PartialWordsMatches value) partialWordsMatches,
    required TResult Function(_ExactMatch value) exactMatch,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return partialWordsMatches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult? Function(_ExactMatch value)? exactMatch,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return partialWordsMatches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult Function(_ExactMatch value)? exactMatch,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (partialWordsMatches != null) {
      return partialWordsMatches(this);
    }
    return orElse();
  }
}

abstract class _PartialWordsMatches implements SearchableTerm {
  const factory _PartialWordsMatches(final List<String> terms) =
      _$PartialWordsMatchesImpl;

  List<String> get terms;
  @JsonKey(ignore: true)
  _$$PartialWordsMatchesImplCopyWith<_$PartialWordsMatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExactMatchImplCopyWith<$Res> {
  factory _$$ExactMatchImplCopyWith(
          _$ExactMatchImpl value, $Res Function(_$ExactMatchImpl) then) =
      __$$ExactMatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String term});
}

/// @nodoc
class __$$ExactMatchImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$ExactMatchImpl>
    implements _$$ExactMatchImplCopyWith<$Res> {
  __$$ExactMatchImplCopyWithImpl(
      _$ExactMatchImpl _value, $Res Function(_$ExactMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
  }) {
    return _then(_$ExactMatchImpl(
      null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExactMatchImpl implements _ExactMatch {
  const _$ExactMatchImpl(this.term);

  @override
  final String term;

  @override
  String toString() {
    return 'SearchableTerm.exactMatch(term: $term)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExactMatchImpl &&
            (identical(other.term, term) || other.term == term));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExactMatchImplCopyWith<_$ExactMatchImpl> get copyWith =>
      __$$ExactMatchImplCopyWithImpl<_$ExactMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) partialWordsMatches,
    required TResult Function(String term) exactMatch,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return exactMatch(term);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? partialWordsMatches,
    TResult? Function(String term)? exactMatch,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return exactMatch?.call(term);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? partialWordsMatches,
    TResult Function(String term)? exactMatch,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (exactMatch != null) {
      return exactMatch(term);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PartialWordsMatches value) partialWordsMatches,
    required TResult Function(_ExactMatch value) exactMatch,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return exactMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult? Function(_ExactMatch value)? exactMatch,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return exactMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult Function(_ExactMatch value)? exactMatch,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (exactMatch != null) {
      return exactMatch(this);
    }
    return orElse();
  }
}

abstract class _ExactMatch implements SearchableTerm {
  const factory _ExactMatch(final String term) = _$ExactMatchImpl;

  String get term;
  @JsonKey(ignore: true)
  _$$ExactMatchImplCopyWith<_$ExactMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavigateOnlyImplCopyWith<$Res> {
  factory _$$NavigateOnlyImplCopyWith(
          _$NavigateOnlyImpl value, $Res Function(_$NavigateOnlyImpl) then) =
      __$$NavigateOnlyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavigateOnlyImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$NavigateOnlyImpl>
    implements _$$NavigateOnlyImplCopyWith<$Res> {
  __$$NavigateOnlyImplCopyWithImpl(
      _$NavigateOnlyImpl _value, $Res Function(_$NavigateOnlyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NavigateOnlyImpl implements _NavigateOnly {
  const _$NavigateOnlyImpl();

  @override
  String toString() {
    return 'SearchableTerm.navigateOnly()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NavigateOnlyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) partialWordsMatches,
    required TResult Function(String term) exactMatch,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return navigateOnly();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? partialWordsMatches,
    TResult? Function(String term)? exactMatch,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return navigateOnly?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? partialWordsMatches,
    TResult Function(String term)? exactMatch,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (navigateOnly != null) {
      return navigateOnly();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PartialWordsMatches value) partialWordsMatches,
    required TResult Function(_ExactMatch value) exactMatch,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return navigateOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult? Function(_ExactMatch value)? exactMatch,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return navigateOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult Function(_ExactMatch value)? exactMatch,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (navigateOnly != null) {
      return navigateOnly(this);
    }
    return orElse();
  }
}

abstract class _NavigateOnly implements SearchableTerm {
  const factory _NavigateOnly() = _$NavigateOnlyImpl;
}

/// @nodoc
abstract class _$$NoneImplCopyWith<$Res> {
  factory _$$NoneImplCopyWith(
          _$NoneImpl value, $Res Function(_$NoneImpl) then) =
      __$$NoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$NoneImpl>
    implements _$$NoneImplCopyWith<$Res> {
  __$$NoneImplCopyWithImpl(_$NoneImpl _value, $Res Function(_$NoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoneImpl implements _None {
  const _$NoneImpl();

  @override
  String toString() {
    return 'SearchableTerm.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) partialWordsMatches,
    required TResult Function(String term) exactMatch,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? partialWordsMatches,
    TResult? Function(String term)? exactMatch,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? partialWordsMatches,
    TResult Function(String term)? exactMatch,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PartialWordsMatches value) partialWordsMatches,
    required TResult Function(_ExactMatch value) exactMatch,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult? Function(_ExactMatch value)? exactMatch,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PartialWordsMatches value)? partialWordsMatches,
    TResult Function(_ExactMatch value)? exactMatch,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None implements SearchableTerm {
  const factory _None() = _$NoneImpl;
}
