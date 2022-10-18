import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/posts_fetcher/posts_fetcher_state.dart';
import 'package:moments_app/domain/posts/posts_repository.dart';

import '../../../domain/categories/category.dart';
import '../../../domain/core/failure.dart';
import '../../../domain/posts/post.dart';

class PostsFetcherCubit extends Cubit<PostsFetcherState> {
  PostsFetcherCubit(this._postRepository)
      : super(const PostsFetcherState.initial());

  final PostsRepository _postRepository;

  Future<void> fetchAllPosts(Category category) async {
    emit(const PostsFetcherState.loading());
    Either<Failure, List<Post>> eitherFailureOrPosts =
        await _postRepository.fetchAllPostsByCategory(category);
    emit(eitherFailureOrPosts.fold((f) => PostsFetcherState.loadedFailure(f),
        (posts) => PostsFetcherState.loadedSuccess(posts)));
  }

}
