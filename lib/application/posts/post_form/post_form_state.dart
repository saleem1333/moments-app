import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/post/post.dart';

import '../../../domain/core/failure.dart';

part 'post_form_state.freezed.dart';

@freezed
class PostFormState with _$PostFormState {
  const factory PostFormState(
      {required PostBody postBody,
      required bool isSubmiting,
      required Either<Failure, Unit>? actionFailureOrSuccess}) = _PostFormState;

  factory PostFormState.initial() => PostFormState(
      postBody: PostBody(''), isSubmiting: false, actionFailureOrSuccess: null);
}
