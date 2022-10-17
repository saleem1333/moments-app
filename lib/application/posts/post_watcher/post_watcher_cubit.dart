import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/post_watcher/post_watcher_state.dart';
import 'package:moments_app/domain/category/category.dart';
import 'package:moments_app/domain/posts/posts_repository.dart';

class PostWatcherCubit extends Cubit<PostWatcherState> {
  PostWatcherCubit(this._postRepository)
      : super(const PostWatcherState.initial());

  final PostsRepository _postRepository;

  StreamSubscription? _streamSubscription;

  Future<void> watchAllStarted(Category category) async {
    emit(const PostWatcherState.loading());
    await _streamSubscription?.cancel();
    _streamSubscription = _postRepository
        .watchAllPostsByCategory(category)
        .listen((failureOrPosts) {
      emit(failureOrPosts.fold((f) => PostWatcherState.loadedFailure(f),
          (posts) => PostWatcherState.loadedSuccess(posts)));
    });
  }

  Future<void> changeCategory(Category category) async {
    return watchAllStarted(category);
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
