import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/core/failure.dart';

part 'post_actor_state.freezed.dart';

@freezed
class PostActorState {
  const factory PostActorState.initial() = _Initial;
  const factory PostActorState.actionLoading() = _ActionLoading;
  const factory PostActorState.updatedSuccess() = _UpdatedSuccess;
  const factory PostActorState.updatedFailure(Failure f) = _UpdatedFailure;
  const factory PostActorState.deletedSuccess() = _DeletedSuccess;
  const factory PostActorState.deletedFailure(Failure failure) =
      _DeletedFailure;
}
