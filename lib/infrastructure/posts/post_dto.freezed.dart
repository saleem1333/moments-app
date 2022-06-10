// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDto _$PostDtoFromJson(Map<String, dynamic> json) {
  return _PostDto.fromJson(json);
}

/// @nodoc
class _$PostDtoTearOff {
  const _$PostDtoTearOff();

  _PostDto call({required String id, required String content}) {
    return _PostDto(
      id: id,
      content: content,
    );
  }

  PostDto fromJson(Map<String, Object?> json) {
    return PostDto.fromJson(json);
  }
}

/// @nodoc
const $PostDto = _$PostDtoTearOff();

/// @nodoc
mixin _$PostDto {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDtoCopyWith<PostDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDtoCopyWith<$Res> {
  factory $PostDtoCopyWith(PostDto value, $Res Function(PostDto) then) =
      _$PostDtoCopyWithImpl<$Res>;
  $Res call({String id, String content});
}

/// @nodoc
class _$PostDtoCopyWithImpl<$Res> implements $PostDtoCopyWith<$Res> {
  _$PostDtoCopyWithImpl(this._value, this._then);

  final PostDto _value;
  // ignore: unused_field
  final $Res Function(PostDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostDtoCopyWith<$Res> implements $PostDtoCopyWith<$Res> {
  factory _$PostDtoCopyWith(_PostDto value, $Res Function(_PostDto) then) =
      __$PostDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String content});
}

/// @nodoc
class __$PostDtoCopyWithImpl<$Res> extends _$PostDtoCopyWithImpl<$Res>
    implements _$PostDtoCopyWith<$Res> {
  __$PostDtoCopyWithImpl(_PostDto _value, $Res Function(_PostDto) _then)
      : super(_value, (v) => _then(v as _PostDto));

  @override
  _PostDto get _value => super._value as _PostDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
  }) {
    return _then(_PostDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDto extends _PostDto {
  const _$_PostDto({required this.id, required this.content}) : super._();

  factory _$_PostDto.fromJson(Map<String, dynamic> json) =>
      _$$_PostDtoFromJson(json);

  @override
  final String id;
  @override
  final String content;

  @override
  String toString() {
    return 'PostDto(id: $id, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$PostDtoCopyWith<_PostDto> get copyWith =>
      __$PostDtoCopyWithImpl<_PostDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDtoToJson(this);
  }
}

abstract class _PostDto extends PostDto {
  const factory _PostDto({required String id, required String content}) =
      _$_PostDto;
  const _PostDto._() : super._();

  factory _PostDto.fromJson(Map<String, dynamic> json) = _$_PostDto.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$PostDtoCopyWith<_PostDto> get copyWith =>
      throw _privateConstructorUsedError;
}
