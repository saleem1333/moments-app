import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/tags/tag.dart';

part 'tags_watcher_state.freezed.dart';

@freezed
class TagsWatcherState {
  const factory TagsWatcherState.initial() = _Initial;
  const factory TagsWatcherState.loading() = _Loading;
  const factory TagsWatcherState.loadedSuccess(List<Tag> tags) = _LoadedSuccess;
  const factory TagsWatcherState.loadedFailure(Failure failure) =
      _LoadedFailure;
}
