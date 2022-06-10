// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserDto _$AppUserDtoFromJson(Map<String, dynamic> json) => AppUserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$AppUserDtoToJson(AppUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
    };
