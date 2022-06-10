// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostFormStateTearOff {
  const _$PostFormStateTearOff();

  _PostFormState call(
      {required PostBody postBody,
      required bool isSubmiting,
      required Either<Failure, Unit>? actionFailureOrSuccess}) {
    return _PostFormState(
      postBody: postBody,
      isSubmiting: isSubmiting,
      actionFailureOrSuccess: actionFailureOrSuccess,
    );
  }
}

/// @nodoc
const $PostFormState = _$PostFormStateTearOff();

/// @nodoc
mixin _$PostFormState {
  PostBody get postBody => throw _privateConstructorUsedError;
  bool get isSubmiting => throw _privateConstructorUsedError;
  Either<Failure, Unit>? get actionFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostFormStateCopyWith<PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFormStateCopyWith<$Res> {
  factory $PostFormStateCopyWith(
          PostFormState value, $Res Function(PostFormState) then) =
      _$PostFormStateCopyWithImpl<$Res>;
  $Res call(
      {PostBody postBody,
      bool isSubmiting,
      Either<Failure, Unit>? actionFailureOrSuccess});
}

/// @nodoc
class _$PostFormStateCopyWithImpl<$Res>
    implements $PostFormStateCopyWith<$Res> {
  _$PostFormStateCopyWithImpl(this._value, this._then);

  final PostFormState _value;
  // ignore: unused_field
  final $Res Function(PostFormState) _then;

  @override
  $Res call({
    Object? postBody = freezed,
    Object? isSubmiting = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      postBody: postBody == freezed
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as PostBody,
      isSubmiting: isSubmiting == freezed
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailureOrSuccess: actionFailureOrSuccess == freezed
          ? _value.actionFailureOrSuccess
          : actionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Unit>?,
    ));
  }
}

/// @nodoc
abstract class _$PostFormStateCopyWith<$Res>
    implements $PostFormStateCopyWith<$Res> {
  factory _$PostFormStateCopyWith(
          _PostFormState value, $Res Function(_PostFormState) then) =
      __$PostFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PostBody postBody,
      bool isSubmiting,
      Either<Failure, Unit>? actionFailureOrSuccess});
}

/// @nodoc
class __$PostFormStateCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res>
    implements _$PostFormStateCopyWith<$Res> {
  __$PostFormStateCopyWithImpl(
      _PostFormState _value, $Res Function(_PostFormState) _then)
      : super(_value, (v) => _then(v as _PostFormState));

  @override
  _PostFormState get _value => super._value as _PostFormState;

  @override
  $Res call({
    Object? postBody = freezed,
    Object? isSubmiting = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_PostFormState(
      postBody: postBody == freezed
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as PostBody,
      isSubmiting: isSubmiting == freezed
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailureOrSuccess: actionFailureOrSuccess == freezed
          ? _value.actionFailureOrSuccess
          : actionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Unit>?,
    ));
  }
}

/// @nodoc

class _$_PostFormState implements _PostFormState {
  const _$_PostFormState(
      {required this.postBody,
      required this.isSubmiting,
      required this.actionFailureOrSuccess});

  @override
  final PostBody postBody;
  @override
  final bool isSubmiting;
  @override
  final Either<Failure, Unit>? actionFailureOrSuccess;

  @override
  String toString() {
    return 'PostFormState(postBody: $postBody, isSubmiting: $isSubmiting, actionFailureOrSuccess: $actionFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostFormState &&
            const DeepCollectionEquality().equals(other.postBody, postBody) &&
            const DeepCollectionEquality()
                .equals(other.isSubmiting, isSubmiting) &&
            const DeepCollectionEquality()
                .equals(other.actionFailureOrSuccess, actionFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postBody),
      const DeepCollectionEquality().hash(isSubmiting),
      const DeepCollectionEquality().hash(actionFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$PostFormStateCopyWith<_PostFormState> get copyWith =>
      __$PostFormStateCopyWithImpl<_PostFormState>(this, _$identity);
}

abstract class _PostFormState implements PostFormState {
  const factory _PostFormState(
          {required PostBody postBody,
          required bool isSubmiting,
          required Either<Failure, Unit>? actionFailureOrSuccess}) =
      _$_PostFormState;

  @override
  PostBody get postBody;
  @override
  bool get isSubmiting;
  @override
  Either<Failure, Unit>? get actionFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$PostFormStateCopyWith<_PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
