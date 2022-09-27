import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/post_actor/post_actor_state.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/posts/post.dart';
import '../../../domain/posts/posts_repository.dart';

class PostActorCubit extends Cubit<PostActorState> {
  PostActorCubit(this._postRepository) : super(const PostActorState.initial());

  final PostsRepository _postRepository;

  Future<void> updated(Post post) async {
    emit(const PostActorState.actionLoading());
    final Either<Failure, Unit> failureOrSuccess =
        await _postRepository.updatePost(post);

    emit(failureOrSuccess.fold((f) => PostActorState.updatedFailure(f),
        (_) => const PostActorState.updatedSuccess()));
  }

  Future<void> deleted(Post post) async {
    emit(const PostActorState.actionLoading());
    final Either<Failure, Unit> failureOrSuccess =
        await _postRepository.deletePost(post);
    emit(failureOrSuccess.fold((f) => PostActorState.deletedFailure(f),
        (_) => const PostActorState.deletedSuccess()));
  }
}
