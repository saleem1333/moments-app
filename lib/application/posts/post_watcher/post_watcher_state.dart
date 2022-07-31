import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/core/failure.dart';

import '../../../domain/posts/post.dart';

part 'post_watcher_state.freezed.dart';

@freezed
class PostWatcherState with _$PostWatcherState {
  const factory PostWatcherState.initial() = _Initial;
  const factory PostWatcherState.loading() = _Loading;
  const factory PostWatcherState.loadedSuccess(List<Post> posts) =
      _LoadedSuccess;
  const factory PostWatcherState.loadedFailure(Failure failure) =
      _LoadedFailure;
}
