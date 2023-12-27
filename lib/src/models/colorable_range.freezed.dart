// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'colorable_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorableRange {
  String get id => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorableRangeCopyWith<ColorableRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorableRangeCopyWith<$Res> {
  factory $ColorableRangeCopyWith(
          ColorableRange value, $Res Function(ColorableRange) then) =
      _$ColorableRangeCopyWithImpl<$Res, ColorableRange>;
  @useResult
  $Res call({String id, int? color, int start, int end});
}

/// @nodoc
class _$ColorableRangeCopyWithImpl<$Res, $Val extends ColorableRange>
    implements $ColorableRangeCopyWith<$Res> {
  _$ColorableRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = freezed,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorableRangeImplCopyWith<$Res>
    implements $ColorableRangeCopyWith<$Res> {
  factory _$$ColorableRangeImplCopyWith(_$ColorableRangeImpl value,
          $Res Function(_$ColorableRangeImpl) then) =
      __$$ColorableRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int? color, int start, int end});
}

/// @nodoc
class __$$ColorableRangeImplCopyWithImpl<$Res>
    extends _$ColorableRangeCopyWithImpl<$Res, _$ColorableRangeImpl>
    implements _$$ColorableRangeImplCopyWith<$Res> {
  __$$ColorableRangeImplCopyWithImpl(
      _$ColorableRangeImpl _value, $Res Function(_$ColorableRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = freezed,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$ColorableRangeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ColorableRangeImpl implements _ColorableRange {
  _$ColorableRangeImpl(
      {required this.id,
      required this.color,
      required this.start,
      required this.end});

  @override
  final String id;
  @override
  final int? color;
  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'ColorableRange(id: $id, color: $color, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorableRangeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, color, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorableRangeImplCopyWith<_$ColorableRangeImpl> get copyWith =>
      __$$ColorableRangeImplCopyWithImpl<_$ColorableRangeImpl>(
          this, _$identity);
}

abstract class _ColorableRange implements ColorableRange {
  factory _ColorableRange(
      {required final String id,
      required final int? color,
      required final int start,
      required final int end}) = _$ColorableRangeImpl;

  @override
  String get id;
  @override
  int? get color;
  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$ColorableRangeImplCopyWith<_$ColorableRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
