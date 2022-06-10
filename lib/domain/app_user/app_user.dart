import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moments_app/domain/app_user/value_objects.dart';
import 'package:moments_app/domain/auth/value_objects.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser(
      {required String id,
      required Username username,
      required EmailAddress emailAddress,
      required Password password}) = _AppUser;
}
