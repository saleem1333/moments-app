import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/post_watcher/post_watcher_state.dart';
import 'package:moments_app/domain/post/post_repository.dart';

class PostWatcherCubit extends Cubit<PostWatcherState> {
  PostWatcherCubit(this._postRepository)
      : super(const PostWatcherState.initial());

  final PostRepository _postRepository;

  StreamSubscription? _streamSubscription;

  Future<void> watchAllStarted() async {
    emit(const PostWatcherState.loading());
    await _streamSubscription?.cancel();
    _streamSubscription =
        _postRepository.watchAllPosts().listen((failureOrPosts) {
      emit(failureOrPosts.fold((f) => PostWatcherState.loadedFailure(f),
          (posts) => PostWatcherState.loadedSuccess(posts)));
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
