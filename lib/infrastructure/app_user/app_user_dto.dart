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
      required this.username});

  final String id;
  final String email;
  final String password;
  final String username;

  factory AppUserDto.fromDomain(AppUser user) => AppUserDto(
      id: user.id,
      email: user.emailAddress.getOrCrash(),
      password: user.password.getOrCrash(),
      username: user.username.getOrCrash());

  AppUser toDomain() => AppUser(
      id: id,
      emailAddress: EmailAddress(email),
      password: Password(password),
      username: Username(username));

  factory AppUserDto.fromJson(Map<String, dynamic> json) =>
      _$AppUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserDtoToJson(this);
}
