import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/app_user/app_user.dart';
import 'package:moments_app/domain/app_user/value_objects.dart';
import 'package:moments_app/domain/auth/value_objects.dart';

part 'app_user_dto.g.dart';

@JsonSerializable()
class AppUserDto {
  const AppUserDto(
      {required this.id,
      required this.email,
      required this.password,
      required this.username,
      required this.userProfileImage});

  final String id;
  final String email;
  final String password;
  final String username;
  @Uint8ListConverter()
  final Uint8List? userProfileImage;

  factory AppUserDto.fromDomain(AppUser user) => AppUserDto(
      id: user.id,
      email: user.emailAddress.getOrCrash(),
      password: user.password.getOrCrash(),
      username: user.username.getOrCrash(),
      userProfileImage: user.userProfileImage?.getOrCrash());

  AppUser toDomain() => AppUser(
      id: id,
      emailAddress: EmailAddress(email),
      password: Password(password),
      username: Username(username),
      userProfileImage: userProfileImage == null
          ? null
          : UserProfileImage(userProfileImage!));

  factory AppUserDto.fromJson(Map<String, dynamic> json) =>
      _$AppUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserDtoToJson(this);
}

class Uint8ListConverter implements JsonConverter<Uint8List, List<int>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<int> list) {
    return Uint8List.fromList(list);
  }

  @override
  List<int> toJson(Uint8List uint8list) {
    return uint8list.toList();
  }
}
