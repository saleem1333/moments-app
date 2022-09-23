// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CateogoryDto _$CateogoryDtoFromJson(Map<String, dynamic> json) {
  return _CateogoryDto.fromJson(json);
}

/// @nodoc
mixin _$CateogoryDto {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CateogoryDtoCopyWith<CateogoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CateogoryDtoCopyWith<$Res> {
  factory $CateogoryDtoCopyWith(
          CateogoryDto value, $Res Function(CateogoryDto) then) =
      _$CateogoryDtoCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$CateogoryDtoCopyWithImpl<$Res> implements $CateogoryDtoCopyWith<$Res> {
  _$CateogoryDtoCopyWithImpl(this._value, this._then);

  final CateogoryDto _value;
  // ignore: unused_field
  final $Res Function(CateogoryDto) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CateogoryDtoCopyWith<$Res>
    implements $CateogoryDtoCopyWith<$Res> {
  factory _$$_CateogoryDtoCopyWith(
          _$_CateogoryDto value, $Res Function(_$_CateogoryDto) then) =
      __$$_CateogoryDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_CateogoryDtoCopyWithImpl<$Res>
    extends _$CateogoryDtoCopyWithImpl<$Res>
    implements _$$_CateogoryDtoCopyWith<$Res> {
  __$$_CateogoryDtoCopyWithImpl(
      _$_CateogoryDto _value, $Res Function(_$_CateogoryDto) _then)
      : super(_value, (v) => _then(v as _$_CateogoryDto));

  @override
  _$_CateogoryDto get _value => super._value as _$_CateogoryDto;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_CateogoryDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CateogoryDto extends _CateogoryDto {
  const _$_CateogoryDto({required this.name}) : super._();

  factory _$_CateogoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_CateogoryDtoFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'CateogoryDto(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CateogoryDto &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_CateogoryDtoCopyWith<_$_CateogoryDto> get copyWith =>
      __$$_CateogoryDtoCopyWithImpl<_$_CateogoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CateogoryDtoToJson(
      this,
    );
  }
}

abstract class _CateogoryDto extends CateogoryDto {
  const factory _CateogoryDto({required final String name}) = _$_CateogoryDto;
  const _CateogoryDto._() : super._();

  factory _CateogoryDto.fromJson(Map<String, dynamic> json) =
      _$_CateogoryDto.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CateogoryDtoCopyWith<_$_CateogoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
