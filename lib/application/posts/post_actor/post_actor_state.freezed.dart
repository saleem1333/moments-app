// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_actor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostActorStateTearOff {
  const _$PostActorStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _ActionLoading actionLoading() {
    return const _ActionLoading();
  }

  _DeletedSuccess deletedSuccess() {
    return const _DeletedSuccess();
  }

  _DeletedFailure deletedFailure(Failure failure) {
    return _DeletedFailure(
      failure,
    );
  }
}

/// @nodoc
const $PostActorState = _$PostActorStateTearOff();

/// @nodoc
mixin _$PostActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionLoading,
    required TResult Function() deletedSuccess,
    required TResult Function(Failure failure) deletedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_DeletedSuccess value) deletedSuccess,
    required TResult Function(_DeletedFailure value) deletedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostActorStateCopyWith<$Res> {
  factory $PostActorStateCopyWith(
          PostActorState value, $Res Function(PostActorState) then) =
      _$PostActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostActorStateCopyWithImpl<$Res>
    implements $PostActorStateCopyWith<$Res> {
  _$PostActorStateCopyWithImpl(this._value, this._then);

  final PostActorState _value;
  // ignore: unused_field
  final $Res Function(PostActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PostActorStateCopyWithImpl<$Res>
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
    return 'PostActorState.initial()';
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
    required TResult Function() actionLoading,
    required TResult Function() deletedSuccess,
    required TResult Function(Failure failure) deletedFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
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
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_DeletedSuccess value) deletedSuccess,
    required TResult Function(_DeletedFailure value) deletedFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ActionLoadingCopyWith<$Res> {
  factory _$ActionLoadingCopyWith(
          _ActionLoading value, $Res Function(_ActionLoading) then) =
      __$ActionLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$ActionLoadingCopyWithImpl<$Res>
    extends _$PostActorStateCopyWithImpl<$Res>
    implements _$ActionLoadingCopyWith<$Res> {
  __$ActionLoadingCopyWithImpl(
      _ActionLoading _value, $Res Function(_ActionLoading) _then)
      : super(_value, (v) => _then(v as _ActionLoading));

  @override
  _ActionLoading get _value => super._value as _ActionLoading;
}

/// @nodoc

class _$_ActionLoading implements _ActionLoading {
  const _$_ActionLoading();

  @override
  String toString() {
    return 'PostActorState.actionLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ActionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionLoading,
    required TResult Function() deletedSuccess,
    required TResult Function(Failure failure) deletedFailure,
  }) {
    return actionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
  }) {
    return actionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_DeletedSuccess value) deletedSuccess,
    required TResult Function(_DeletedFailure value) deletedFailure,
  }) {
    return actionLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
  }) {
    return actionLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
    required TResult orElse(),
  }) {
    if (actionLoading != null) {
      return actionLoading(this);
    }
    return orElse();
  }
}

abstract class _ActionLoading implements PostActorState {
  const factory _ActionLoading() = _$_ActionLoading;
}

/// @nodoc
abstract class _$DeletedSuccessCopyWith<$Res> {
  factory _$DeletedSuccessCopyWith(
          _DeletedSuccess value, $Res Function(_DeletedSuccess) then) =
      __$DeletedSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeletedSuccessCopyWithImpl<$Res>
    extends _$PostActorStateCopyWithImpl<$Res>
    implements _$DeletedSuccessCopyWith<$Res> {
  __$DeletedSuccessCopyWithImpl(
      _DeletedSuccess _value, $Res Function(_DeletedSuccess) _then)
      : super(_value, (v) => _then(v as _DeletedSuccess));

  @override
  _DeletedSuccess get _value => super._value as _DeletedSuccess;
}

/// @nodoc

class _$_DeletedSuccess implements _DeletedSuccess {
  const _$_DeletedSuccess();

  @override
  String toString() {
    return 'PostActorState.deletedSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeletedSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionLoading,
    required TResult Function() deletedSuccess,
    required TResult Function(Failure failure) deletedFailure,
  }) {
    return deletedSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
  }) {
    return deletedSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
    required TResult orElse(),
  }) {
    if (deletedSuccess != null) {
      return deletedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_DeletedSuccess value) deletedSuccess,
    required TResult Function(_DeletedFailure value) deletedFailure,
  }) {
    return deletedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
  }) {
    return deletedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
    required TResult orElse(),
  }) {
    if (deletedSuccess != null) {
      return deletedSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeletedSuccess implements PostActorState {
  const factory _DeletedSuccess() = _$_DeletedSuccess;
}

/// @nodoc
abstract class _$DeletedFailureCopyWith<$Res> {
  factory _$DeletedFailureCopyWith(
          _DeletedFailure value, $Res Function(_DeletedFailure) then) =
      __$DeletedFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$DeletedFailureCopyWithImpl<$Res>
    extends _$PostActorStateCopyWithImpl<$Res>
    implements _$DeletedFailureCopyWith<$Res> {
  __$DeletedFailureCopyWithImpl(
      _DeletedFailure _value, $Res Function(_DeletedFailure) _then)
      : super(_value, (v) => _then(v as _DeletedFailure));

  @override
  _DeletedFailure get _value => super._value as _DeletedFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_DeletedFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_DeletedFailure implements _DeletedFailure {
  const _$_DeletedFailure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PostActorState.deletedFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeletedFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$DeletedFailureCopyWith<_DeletedFailure> get copyWith =>
      __$DeletedFailureCopyWithImpl<_DeletedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() actionLoading,
    required TResult Function() deletedSuccess,
    required TResult Function(Failure failure) deletedFailure,
  }) {
    return deletedFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
  }) {
    return deletedFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? actionLoading,
    TResult Function()? deletedSuccess,
    TResult Function(Failure failure)? deletedFailure,
    required TResult orElse(),
  }) {
    if (deletedFailure != null) {
      return deletedFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ActionLoading value) actionLoading,
    required TResult Function(_DeletedSuccess value) deletedSuccess,
    required TResult Function(_DeletedFailure value) deletedFailure,
  }) {
    return deletedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
  }) {
    return deletedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ActionLoading value)? actionLoading,
    TResult Function(_DeletedSuccess value)? deletedSuccess,
    TResult Function(_DeletedFailure value)? deletedFailure,
    required TResult orElse(),
  }) {
    if (deletedFailure != null) {
      return deletedFailure(this);
    }
    return orElse();
  }
}

abstract class _DeletedFailure implements PostActorState {
  const factory _DeletedFailure(Failure failure) = _$_DeletedFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$DeletedFailureCopyWith<_DeletedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
