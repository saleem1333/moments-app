import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/categories/category.dart';

part 'category_dto.g.dart';
part 'category_dto.freezed.dart';

@freezed
class CateogoryDto with _$CateogoryDto {
  const CateogoryDto._();

  const factory CateogoryDto({required String name}) =
      _CateogoryDto;

  factory CateogoryDto.fromDomain(Category cateogory) =>
      CateogoryDto(name: cateogory.name.getOrCrash());

  factory CateogoryDto.fromJson(Map<String, dynamic> json) =>
      _$CateogoryDtoFromJson(json);

  Category toDomain() => Category(name: CategoryName(name));
}
