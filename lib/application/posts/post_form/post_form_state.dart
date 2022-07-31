import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failure.dart';
import '../../../domain/posts/post.dart';

part 'post_form_state.freezed.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState(
      {required PostBody postBody,
      required PostTags tags,
      required bool isSubmiting,
      required Either<Failure, Unit>? actionFailureOrSuccess}) = _PostFormState;

  factory PostFormState.initial() => PostFormState(
      postBody: PostBody(''),
      tags: PostTags([]),
      isSubmiting: false,
      actionFailureOrSuccess: null);
}
