import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/core/failure.dart';

import '../../../domain/posts/post.dart';

part 'posts_fetcher_state.freezed.dart';

@freezed
class PostsFetcherState with _$PostsFetcherState {
  const factory PostsFetcherState.initial() = _Initial;
  const factory PostsFetcherState.loading() = _Loading;
  const factory PostsFetcherState.loadedSuccess(List<Post> posts) =
      _LoadedSuccess;
  const factory PostsFetcherState.loadedFailure(Failure failure) =
      _LoadedFailure;
}
