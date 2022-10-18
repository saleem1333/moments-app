import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/post_form/post_form_state.dart';
import 'package:moments_app/domain/categories/category.dart';
import 'package:moments_app/domain/core/id_generator.dart';
import 'package:moments_app/domain/posts/posts_repository.dart';
import 'package:moments_app/domain/tags/tag.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/posts/post.dart';

class PostFormCubit extends Cubit<PostFormState> {
  PostFormCubit(this._repository) : super(PostFormState.initial());

  final PostsRepository _repository;

  void postBodyChanged(String postBodyStr) {
    emit(state.copyWith(
        postBody: PostBody(postBodyStr), actionFailureOrSuccess: null));
  }

  void categoryChanged(String categoryStr) {
    emit(state.copyWith(
        category: Category(name: CategoryName(categoryStr)),
        actionFailureOrSuccess: null));
  }

  void tagsChanged(List<String> tags) {
    emit(state.copyWith(
        tags: PostTags(tags
            .map((tag) => Tag(id: generateId(), name: TagName(tag)))
            .toList())));
  }

  Future<void> created() async {
    emit(state.copyWith(
        showErrors: true, isSubmiting: true, actionFailureOrSuccess: null));

    if (state.postBody.isValid() &&
        state.category.name.isValid() &&
        state.tags.isValid()) {
      final Either<Failure, Unit> failureOrSuccess =
          await _repository.createPost(Post(
              id: generateId(),
              category: state.category,
              appUser: null,
              content: state.postBody,
              createdAt: null,
              tags: state.tags,
              votes: PostVotes(const []),
              comments: PostComments(const [])));
      emit(state.copyWith(
          showErrors: false,
          actionFailureOrSuccess: failureOrSuccess,
          isSubmiting: false));
    }
  }
}
