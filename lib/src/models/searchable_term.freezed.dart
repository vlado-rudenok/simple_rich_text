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
    required TResult Function(List<String> terms) matchAllTerms,
    required TResult Function(List<String> terms) matchAnyTerms,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? matchAllTerms,
    TResult? Function(List<String> terms)? matchAnyTerms,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? matchAllTerms,
    TResult Function(List<String> terms)? matchAnyTerms,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchAllTerms value) matchAllTerms,
    required TResult Function(_MatchAnyTerms value) matchAnyTerms,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchAllTerms value)? matchAllTerms,
    TResult? Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchAllTerms value)? matchAllTerms,
    TResult Function(_MatchAnyTerms value)? matchAnyTerms,
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
abstract class _$$MatchAllTermsImplCopyWith<$Res> {
  factory _$$MatchAllTermsImplCopyWith(
          _$MatchAllTermsImpl value, $Res Function(_$MatchAllTermsImpl) then) =
      __$$MatchAllTermsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> terms});
}

/// @nodoc
class __$$MatchAllTermsImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$MatchAllTermsImpl>
    implements _$$MatchAllTermsImplCopyWith<$Res> {
  __$$MatchAllTermsImplCopyWithImpl(
      _$MatchAllTermsImpl _value, $Res Function(_$MatchAllTermsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$MatchAllTermsImpl(
      null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MatchAllTermsImpl implements _MatchAllTerms {
  const _$MatchAllTermsImpl(final List<String> terms) : _terms = terms;

  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'SearchableTerm.matchAllTerms(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchAllTermsImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchAllTermsImplCopyWith<_$MatchAllTermsImpl> get copyWith =>
      __$$MatchAllTermsImplCopyWithImpl<_$MatchAllTermsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) matchAllTerms,
    required TResult Function(List<String> terms) matchAnyTerms,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return matchAllTerms(terms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? matchAllTerms,
    TResult? Function(List<String> terms)? matchAnyTerms,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return matchAllTerms?.call(terms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? matchAllTerms,
    TResult Function(List<String> terms)? matchAnyTerms,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (matchAllTerms != null) {
      return matchAllTerms(terms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchAllTerms value) matchAllTerms,
    required TResult Function(_MatchAnyTerms value) matchAnyTerms,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return matchAllTerms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchAllTerms value)? matchAllTerms,
    TResult? Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return matchAllTerms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchAllTerms value)? matchAllTerms,
    TResult Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (matchAllTerms != null) {
      return matchAllTerms(this);
    }
    return orElse();
  }
}

abstract class _MatchAllTerms implements SearchableTerm {
  const factory _MatchAllTerms(final List<String> terms) = _$MatchAllTermsImpl;

  List<String> get terms;
  @JsonKey(ignore: true)
  _$$MatchAllTermsImplCopyWith<_$MatchAllTermsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchAnyTermsImplCopyWith<$Res> {
  factory _$$MatchAnyTermsImplCopyWith(
          _$MatchAnyTermsImpl value, $Res Function(_$MatchAnyTermsImpl) then) =
      __$$MatchAnyTermsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> terms});
}

/// @nodoc
class __$$MatchAnyTermsImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$MatchAnyTermsImpl>
    implements _$$MatchAnyTermsImplCopyWith<$Res> {
  __$$MatchAnyTermsImplCopyWithImpl(
      _$MatchAnyTermsImpl _value, $Res Function(_$MatchAnyTermsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$MatchAnyTermsImpl(
      null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MatchAnyTermsImpl implements _MatchAnyTerms {
  const _$MatchAnyTermsImpl(final List<String> terms) : _terms = terms;

  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'SearchableTerm.matchAnyTerms(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchAnyTermsImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchAnyTermsImplCopyWith<_$MatchAnyTermsImpl> get copyWith =>
      __$$MatchAnyTermsImplCopyWithImpl<_$MatchAnyTermsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) matchAllTerms,
    required TResult Function(List<String> terms) matchAnyTerms,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return matchAnyTerms(terms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? matchAllTerms,
    TResult? Function(List<String> terms)? matchAnyTerms,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return matchAnyTerms?.call(terms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? matchAllTerms,
    TResult Function(List<String> terms)? matchAnyTerms,
    TResult Function()? navigateOnly,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (matchAnyTerms != null) {
      return matchAnyTerms(terms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchAllTerms value) matchAllTerms,
    required TResult Function(_MatchAnyTerms value) matchAnyTerms,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return matchAnyTerms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchAllTerms value)? matchAllTerms,
    TResult? Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return matchAnyTerms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchAllTerms value)? matchAllTerms,
    TResult Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult Function(_NavigateOnly value)? navigateOnly,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (matchAnyTerms != null) {
      return matchAnyTerms(this);
    }
    return orElse();
  }
}

abstract class _MatchAnyTerms implements SearchableTerm {
  const factory _MatchAnyTerms(final List<String> terms) = _$MatchAnyTermsImpl;

  List<String> get terms;
  @JsonKey(ignore: true)
  _$$MatchAnyTermsImplCopyWith<_$MatchAnyTermsImpl> get copyWith =>
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
    required TResult Function(List<String> terms) matchAllTerms,
    required TResult Function(List<String> terms) matchAnyTerms,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return navigateOnly();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? matchAllTerms,
    TResult? Function(List<String> terms)? matchAnyTerms,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return navigateOnly?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? matchAllTerms,
    TResult Function(List<String> terms)? matchAnyTerms,
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
    required TResult Function(_MatchAllTerms value) matchAllTerms,
    required TResult Function(_MatchAnyTerms value) matchAnyTerms,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return navigateOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchAllTerms value)? matchAllTerms,
    TResult? Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return navigateOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchAllTerms value)? matchAllTerms,
    TResult Function(_MatchAnyTerms value)? matchAnyTerms,
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
    required TResult Function(List<String> terms) matchAllTerms,
    required TResult Function(List<String> terms) matchAnyTerms,
    required TResult Function() navigateOnly,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? matchAllTerms,
    TResult? Function(List<String> terms)? matchAnyTerms,
    TResult? Function()? navigateOnly,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? matchAllTerms,
    TResult Function(List<String> terms)? matchAnyTerms,
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
    required TResult Function(_MatchAllTerms value) matchAllTerms,
    required TResult Function(_MatchAnyTerms value) matchAnyTerms,
    required TResult Function(_NavigateOnly value) navigateOnly,
    required TResult Function(_None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MatchAllTerms value)? matchAllTerms,
    TResult? Function(_MatchAnyTerms value)? matchAnyTerms,
    TResult? Function(_NavigateOnly value)? navigateOnly,
    TResult? Function(_None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchAllTerms value)? matchAllTerms,
    TResult Function(_MatchAnyTerms value)? matchAnyTerms,
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
