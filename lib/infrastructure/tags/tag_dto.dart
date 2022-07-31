import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/tags/tag.dart';

part 'tag_dto.g.dart';
part 'tag_dto.freezed.dart';

@freezed
class TagDto with _$TagDto {
  const TagDto._();
  const factory TagDto({required String id, required String name}) = _TagDto;

  factory TagDto.fromDomain(Tag tag) =>
      TagDto(id: tag.id, name: tag.name.getOrCrash());

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  Tag toDomain() => Tag(id: id, name: TagName(name));
}
