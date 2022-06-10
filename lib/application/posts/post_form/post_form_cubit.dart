import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments_app/application/posts/post_form/post_form_state.dart';
import 'package:moments_app/domain/core/id_generator.dart';
import 'package:moments_app/domain/post/post_repository.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/post/post.dart';

class PostFormCubit extends Cubit<PostFormState> {
  PostFormCubit(this._repository) : super(PostFormState.initial());

  final PostRepository _repository;

  void postBodyChanged(String postBodyStr) {
    emit(state.copyWith(postBody: PostBody(postBodyStr)));
  }

  Future<void> created() async {
    emit(state.copyWith(isSubmiting: true, actionFailureOrSuccess: null));
    final Either<Failure, Unit> failureOrSuccess = await _repository
        .createPost(Post(id: generateId(), content: state.postBody));
    emit(state.copyWith(
        actionFailureOrSuccess: failureOrSuccess, isSubmiting: false));
  }
}
