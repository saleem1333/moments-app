import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/category/category.dart';
import 'package:moments_app/domain/core/id_generator.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/posts/post.dart';

part 'post_form_state.freezed.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState(
      {required PostBody postBody,
      required Category category,
      required PostTags tags,
      required bool isSubmiting,
      required bool showErrors,
      required Either<Failure, Unit>? actionFailureOrSuccess}) = _PostFormState;

  factory PostFormState.initial() => PostFormState(
      postBody: PostBody(''),
      category: Category(name: CategoryName('')),
      tags: PostTags(const []),
      isSubmiting: false,
      showErrors: false,
      actionFailureOrSuccess: null);
}
