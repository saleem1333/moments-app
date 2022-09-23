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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostFormState {
  PostBody get postBody => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  PostTags get tags => throw _privateConstructorUsedError;
  bool get isSubmiting => throw _privateConstructorUsedError;
  bool get showErrors => throw _privateConstructorUsedError;
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
      Category category,
      PostTags tags,
      bool isSubmiting,
      bool showErrors,
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
    Object? category = freezed,
    Object? tags = freezed,
    Object? isSubmiting = freezed,
    Object? showErrors = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      postBody: postBody == freezed
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as PostBody,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as PostTags,
      isSubmiting: isSubmiting == freezed
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrors: showErrors == freezed
          ? _value.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      actionFailureOrSuccess: actionFailureOrSuccess == freezed
          ? _value.actionFailureOrSuccess
          : actionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<Failure, Unit>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PostFormStateCopyWith<$Res>
    implements $PostFormStateCopyWith<$Res> {
  factory _$$_PostFormStateCopyWith(
          _$_PostFormState value, $Res Function(_$_PostFormState) then) =
      __$$_PostFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PostBody postBody,
      Category category,
      PostTags tags,
      bool isSubmiting,
      bool showErrors,
      Either<Failure, Unit>? actionFailureOrSuccess});
}

/// @nodoc
class __$$_PostFormStateCopyWithImpl<$Res>
    extends _$PostFormStateCopyWithImpl<$Res>
    implements _$$_PostFormStateCopyWith<$Res> {
  __$$_PostFormStateCopyWithImpl(
      _$_PostFormState _value, $Res Function(_$_PostFormState) _then)
      : super(_value, (v) => _then(v as _$_PostFormState));

  @override
  _$_PostFormState get _value => super._value as _$_PostFormState;

  @override
  $Res call({
    Object? postBody = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? isSubmiting = freezed,
    Object? showErrors = freezed,
    Object? actionFailureOrSuccess = freezed,
  }) {
    return _then(_$_PostFormState(
      postBody: postBody == freezed
          ? _value.postBody
          : postBody // ignore: cast_nullable_to_non_nullable
              as PostBody,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as PostTags,
      isSubmiting: isSubmiting == freezed
          ? _value.isSubmiting
          : isSubmiting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrors: showErrors == freezed
          ? _value.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
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
      required this.category,
      required this.tags,
      required this.isSubmiting,
      required this.showErrors,
      required this.actionFailureOrSuccess});

  @override
  final PostBody postBody;
  @override
  final Category category;
  @override
  final PostTags tags;
  @override
  final bool isSubmiting;
  @override
  final bool showErrors;
  @override
  final Either<Failure, Unit>? actionFailureOrSuccess;

  @override
  String toString() {
    return 'PostFormState(postBody: $postBody, category: $category, tags: $tags, isSubmiting: $isSubmiting, showErrors: $showErrors, actionFailureOrSuccess: $actionFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostFormState &&
            const DeepCollectionEquality().equals(other.postBody, postBody) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.isSubmiting, isSubmiting) &&
            const DeepCollectionEquality()
                .equals(other.showErrors, showErrors) &&
            const DeepCollectionEquality()
                .equals(other.actionFailureOrSuccess, actionFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postBody),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(isSubmiting),
      const DeepCollectionEquality().hash(showErrors),
      const DeepCollectionEquality().hash(actionFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_PostFormStateCopyWith<_$_PostFormState> get copyWith =>
      __$$_PostFormStateCopyWithImpl<_$_PostFormState>(this, _$identity);
}

abstract class _PostFormState implements PostFormState {
  const factory _PostFormState(
          {required final PostBody postBody,
          required final Category category,
          required final PostTags tags,
          required final bool isSubmiting,
          required final bool showErrors,
          required final Either<Failure, Unit>? actionFailureOrSuccess}) =
      _$_PostFormState;

  @override
  PostBody get postBody;
  @override
  Category get category;
  @override
  PostTags get tags;
  @override
  bool get isSubmiting;
  @override
  bool get showErrors;
  @override
  Either<Failure, Unit>? get actionFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_PostFormStateCopyWith<_$_PostFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
