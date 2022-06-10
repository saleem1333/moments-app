// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_watcher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostWatcherStateTearOff {
  const _$PostWatcherStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _LoadedSuccess loadedSuccess(List<Post> posts) {
    return _LoadedSuccess(
      posts,
    );
  }

  _LoadedFailure loadedFailure(Failure failure) {
    return _LoadedFailure(
      failure,
    );
  }
}

/// @nodoc
const $PostWatcherState = _$PostWatcherStateTearOff();

/// @nodoc
mixin _$PostWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostWatcherStateCopyWith<$Res> {
  factory $PostWatcherStateCopyWith(
          PostWatcherState value, $Res Function(PostWatcherState) then) =
      _$PostWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostWatcherStateCopyWithImpl<$Res>
    implements $PostWatcherStateCopyWith<$Res> {
  _$PostWatcherStateCopyWithImpl(this._value, this._then);

  final PostWatcherState _value;
  // ignore: unused_field
  final $Res Function(PostWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PostWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PostWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PostWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'PostWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedSuccessCopyWith<$Res> {
  factory _$LoadedSuccessCopyWith(
          _LoadedSuccess value, $Res Function(_LoadedSuccess) then) =
      __$LoadedSuccessCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

/// @nodoc
class __$LoadedSuccessCopyWithImpl<$Res>
    extends _$PostWatcherStateCopyWithImpl<$Res>
    implements _$LoadedSuccessCopyWith<$Res> {
  __$LoadedSuccessCopyWithImpl(
      _LoadedSuccess _value, $Res Function(_LoadedSuccess) _then)
      : super(_value, (v) => _then(v as _LoadedSuccess));

  @override
  _LoadedSuccess get _value => super._value as _LoadedSuccess;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_LoadedSuccess(
      posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$_LoadedSuccess implements _LoadedSuccess {
  const _$_LoadedSuccess(this.posts);

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'PostWatcherState.loadedSuccess(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedSuccess &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$LoadedSuccessCopyWith<_LoadedSuccess> get copyWith =>
      __$LoadedSuccessCopyWithImpl<_LoadedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loadedSuccess(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
  }) {
    return loadedSuccess?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loadedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
  }) {
    return loadedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedSuccess != null) {
      return loadedSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadedSuccess implements PostWatcherState {
  const factory _LoadedSuccess(List<Post> posts) = _$_LoadedSuccess;

  List<Post> get posts;
  @JsonKey(ignore: true)
  _$LoadedSuccessCopyWith<_LoadedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedFailureCopyWith<$Res> {
  factory _$LoadedFailureCopyWith(
          _LoadedFailure value, $Res Function(_LoadedFailure) then) =
      __$LoadedFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$LoadedFailureCopyWithImpl<$Res>
    extends _$PostWatcherStateCopyWithImpl<$Res>
    implements _$LoadedFailureCopyWith<$Res> {
  __$LoadedFailureCopyWithImpl(
      _LoadedFailure _value, $Res Function(_LoadedFailure) _then)
      : super(_value, (v) => _then(v as _LoadedFailure));

  @override
  _LoadedFailure get _value => super._value as _LoadedFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_LoadedFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_LoadedFailure implements _LoadedFailure {
  const _$_LoadedFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PostWatcherState.loadedFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$LoadedFailureCopyWith<_LoadedFailure> get copyWith =>
      __$LoadedFailureCopyWithImpl<_LoadedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Post> posts) loadedSuccess,
    required TResult Function(Failure failure) loadedFailure,
  }) {
    return loadedFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
  }) {
    return loadedFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Post> posts)? loadedSuccess,
    TResult Function(Failure failure)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedFailure != null) {
      return loadedFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedSuccess value) loadedSuccess,
    required TResult Function(_LoadedFailure value) loadedFailure,
  }) {
    return loadedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
  }) {
    return loadedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedSuccess value)? loadedSuccess,
    TResult Function(_LoadedFailure value)? loadedFailure,
    required TResult orElse(),
  }) {
    if (loadedFailure != null) {
      return loadedFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadedFailure implements PostWatcherState {
  const factory _LoadedFailure(Failure failure) = _$_LoadedFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$LoadedFailureCopyWith<_LoadedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
