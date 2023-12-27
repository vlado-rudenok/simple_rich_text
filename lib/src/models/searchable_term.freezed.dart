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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchableTerm {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) global,
    required TResult Function(List<String> terms) localAllMatch,
    required TResult Function(String term) localExactMatch,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? global,
    TResult? Function(List<String> terms)? localAllMatch,
    TResult? Function(String term)? localExactMatch,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? global,
    TResult Function(List<String> terms)? localAllMatch,
    TResult Function(String term)? localExactMatch,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Global value) global,
    required TResult Function(_LocalAllMatch value) localAllMatch,
    required TResult Function(_LocalExactMatch value) localExactMatch,
    required TResult Function(_None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Global value)? global,
    TResult? Function(_LocalAllMatch value)? localAllMatch,
    TResult? Function(_LocalExactMatch value)? localExactMatch,
    TResult? Function(_None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Global value)? global,
    TResult Function(_LocalAllMatch value)? localAllMatch,
    TResult Function(_LocalExactMatch value)? localExactMatch,
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
abstract class _$$GlobalImplCopyWith<$Res> {
  factory _$$GlobalImplCopyWith(
          _$GlobalImpl value, $Res Function(_$GlobalImpl) then) =
      __$$GlobalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> terms});
}

/// @nodoc
class __$$GlobalImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$GlobalImpl>
    implements _$$GlobalImplCopyWith<$Res> {
  __$$GlobalImplCopyWithImpl(
      _$GlobalImpl _value, $Res Function(_$GlobalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$GlobalImpl(
      null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$GlobalImpl implements _Global {
  const _$GlobalImpl(final List<String> terms) : _terms = terms;

  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'SearchableTerm.global(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalImplCopyWith<_$GlobalImpl> get copyWith =>
      __$$GlobalImplCopyWithImpl<_$GlobalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) global,
    required TResult Function(List<String> terms) localAllMatch,
    required TResult Function(String term) localExactMatch,
    required TResult Function() none,
  }) {
    return global(terms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? global,
    TResult? Function(List<String> terms)? localAllMatch,
    TResult? Function(String term)? localExactMatch,
    TResult? Function()? none,
  }) {
    return global?.call(terms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? global,
    TResult Function(List<String> terms)? localAllMatch,
    TResult Function(String term)? localExactMatch,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (global != null) {
      return global(terms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Global value) global,
    required TResult Function(_LocalAllMatch value) localAllMatch,
    required TResult Function(_LocalExactMatch value) localExactMatch,
    required TResult Function(_None value) none,
  }) {
    return global(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Global value)? global,
    TResult? Function(_LocalAllMatch value)? localAllMatch,
    TResult? Function(_LocalExactMatch value)? localExactMatch,
    TResult? Function(_None value)? none,
  }) {
    return global?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Global value)? global,
    TResult Function(_LocalAllMatch value)? localAllMatch,
    TResult Function(_LocalExactMatch value)? localExactMatch,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (global != null) {
      return global(this);
    }
    return orElse();
  }
}

abstract class _Global implements SearchableTerm {
  const factory _Global(final List<String> terms) = _$GlobalImpl;

  List<String> get terms;
  @JsonKey(ignore: true)
  _$$GlobalImplCopyWith<_$GlobalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalAllMatchImplCopyWith<$Res> {
  factory _$$LocalAllMatchImplCopyWith(
          _$LocalAllMatchImpl value, $Res Function(_$LocalAllMatchImpl) then) =
      __$$LocalAllMatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> terms});
}

/// @nodoc
class __$$LocalAllMatchImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$LocalAllMatchImpl>
    implements _$$LocalAllMatchImplCopyWith<$Res> {
  __$$LocalAllMatchImplCopyWithImpl(
      _$LocalAllMatchImpl _value, $Res Function(_$LocalAllMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$LocalAllMatchImpl(
      null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LocalAllMatchImpl implements _LocalAllMatch {
  const _$LocalAllMatchImpl(final List<String> terms) : _terms = terms;

  final List<String> _terms;
  @override
  List<String> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'SearchableTerm.localAllMatch(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAllMatchImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAllMatchImplCopyWith<_$LocalAllMatchImpl> get copyWith =>
      __$$LocalAllMatchImplCopyWithImpl<_$LocalAllMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) global,
    required TResult Function(List<String> terms) localAllMatch,
    required TResult Function(String term) localExactMatch,
    required TResult Function() none,
  }) {
    return localAllMatch(terms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? global,
    TResult? Function(List<String> terms)? localAllMatch,
    TResult? Function(String term)? localExactMatch,
    TResult? Function()? none,
  }) {
    return localAllMatch?.call(terms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? global,
    TResult Function(List<String> terms)? localAllMatch,
    TResult Function(String term)? localExactMatch,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (localAllMatch != null) {
      return localAllMatch(terms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Global value) global,
    required TResult Function(_LocalAllMatch value) localAllMatch,
    required TResult Function(_LocalExactMatch value) localExactMatch,
    required TResult Function(_None value) none,
  }) {
    return localAllMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Global value)? global,
    TResult? Function(_LocalAllMatch value)? localAllMatch,
    TResult? Function(_LocalExactMatch value)? localExactMatch,
    TResult? Function(_None value)? none,
  }) {
    return localAllMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Global value)? global,
    TResult Function(_LocalAllMatch value)? localAllMatch,
    TResult Function(_LocalExactMatch value)? localExactMatch,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (localAllMatch != null) {
      return localAllMatch(this);
    }
    return orElse();
  }
}

abstract class _LocalAllMatch implements SearchableTerm {
  const factory _LocalAllMatch(final List<String> terms) = _$LocalAllMatchImpl;

  List<String> get terms;
  @JsonKey(ignore: true)
  _$$LocalAllMatchImplCopyWith<_$LocalAllMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalExactMatchImplCopyWith<$Res> {
  factory _$$LocalExactMatchImplCopyWith(_$LocalExactMatchImpl value,
          $Res Function(_$LocalExactMatchImpl) then) =
      __$$LocalExactMatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String term});
}

/// @nodoc
class __$$LocalExactMatchImplCopyWithImpl<$Res>
    extends _$SearchableTermCopyWithImpl<$Res, _$LocalExactMatchImpl>
    implements _$$LocalExactMatchImplCopyWith<$Res> {
  __$$LocalExactMatchImplCopyWithImpl(
      _$LocalExactMatchImpl _value, $Res Function(_$LocalExactMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
  }) {
    return _then(_$LocalExactMatchImpl(
      null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocalExactMatchImpl implements _LocalExactMatch {
  const _$LocalExactMatchImpl(this.term);

  @override
  final String term;

  @override
  String toString() {
    return 'SearchableTerm.localExactMatch(term: $term)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalExactMatchImpl &&
            (identical(other.term, term) || other.term == term));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalExactMatchImplCopyWith<_$LocalExactMatchImpl> get copyWith =>
      __$$LocalExactMatchImplCopyWithImpl<_$LocalExactMatchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> terms) global,
    required TResult Function(List<String> terms) localAllMatch,
    required TResult Function(String term) localExactMatch,
    required TResult Function() none,
  }) {
    return localExactMatch(term);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? global,
    TResult? Function(List<String> terms)? localAllMatch,
    TResult? Function(String term)? localExactMatch,
    TResult? Function()? none,
  }) {
    return localExactMatch?.call(term);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? global,
    TResult Function(List<String> terms)? localAllMatch,
    TResult Function(String term)? localExactMatch,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (localExactMatch != null) {
      return localExactMatch(term);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Global value) global,
    required TResult Function(_LocalAllMatch value) localAllMatch,
    required TResult Function(_LocalExactMatch value) localExactMatch,
    required TResult Function(_None value) none,
  }) {
    return localExactMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Global value)? global,
    TResult? Function(_LocalAllMatch value)? localAllMatch,
    TResult? Function(_LocalExactMatch value)? localExactMatch,
    TResult? Function(_None value)? none,
  }) {
    return localExactMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Global value)? global,
    TResult Function(_LocalAllMatch value)? localAllMatch,
    TResult Function(_LocalExactMatch value)? localExactMatch,
    TResult Function(_None value)? none,
    required TResult orElse(),
  }) {
    if (localExactMatch != null) {
      return localExactMatch(this);
    }
    return orElse();
  }
}

abstract class _LocalExactMatch implements SearchableTerm {
  const factory _LocalExactMatch(final String term) = _$LocalExactMatchImpl;

  String get term;
  @JsonKey(ignore: true)
  _$$LocalExactMatchImplCopyWith<_$LocalExactMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(List<String> terms) global,
    required TResult Function(List<String> terms) localAllMatch,
    required TResult Function(String term) localExactMatch,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> terms)? global,
    TResult? Function(List<String> terms)? localAllMatch,
    TResult? Function(String term)? localExactMatch,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> terms)? global,
    TResult Function(List<String> terms)? localAllMatch,
    TResult Function(String term)? localExactMatch,
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
    required TResult Function(_Global value) global,
    required TResult Function(_LocalAllMatch value) localAllMatch,
    required TResult Function(_LocalExactMatch value) localExactMatch,
    required TResult Function(_None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Global value)? global,
    TResult? Function(_LocalAllMatch value)? localAllMatch,
    TResult? Function(_LocalExactMatch value)? localExactMatch,
    TResult? Function(_None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Global value)? global,
    TResult Function(_LocalAllMatch value)? localAllMatch,
    TResult Function(_LocalExactMatch value)? localExactMatch,
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
