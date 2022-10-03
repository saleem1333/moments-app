import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/posts/vote.dart';
import 'package:moments_app/infrastructure/app_user/app_user_dto.dart';

part 'vote_dto.freezed.dart';
part 'vote_dto.g.dart';

@freezed
class VoteDto with _$VoteDto {
  const VoteDto._();

  const factory VoteDto({required AppUserDto user, required VoteType type}) =
      _VoteDto;

  factory VoteDto.fromDomain(Vote vote) =>
      VoteDto(user: AppUserDto.fromDomain(vote.user), type: vote.type);

  factory VoteDto.fromJson(Map<String, dynamic> json) =>
      _$VoteDtoFromJson(json);

  Vote toDomain() => Vote(user: user.toDomain(), type: type);
}
