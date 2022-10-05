import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/infrastructure/app_user/app_user_dto.dart';
import 'package:moments_app/infrastructure/posts/vote_dto.dart';

import '../../domain/posts/comment.dart';
part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
class CommentDto with _$CommentDto {
  const CommentDto._();
  const factory CommentDto(
      {required AppUserDto user,
      required String body,
      required List<VoteDto> votes}) = _CommentDto;

  factory CommentDto.fromDomain(Comment comment) => CommentDto(
      user: AppUserDto.fromDomain(comment.user),
      body: comment.body.getOrCrash(),
      votes: comment.votes
          .getOrCrash()
          .map((vote) => VoteDto.fromDomain(vote))
          .toList());

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Comment toDomain() {
    return Comment(
        user: user.toDomain(),
        body: CommentBody(body),
        votes: CommentVotes(votes.map((vote) => vote.toDomain()).toList()));
  }
}
