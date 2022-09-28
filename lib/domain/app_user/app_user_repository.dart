import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/app_user/app_user.dart';
import 'package:moments_app/domain/app_user/value_objects.dart';
import 'package:moments_app/domain/auth/value_objects.dart';

import '../auth/auth_failure.dart';
import '../core/failure.dart';

abstract class AppUserRepository {
  // create a new user
  Future<Either<AuthFailure, Unit>> createUser(AppUser user);

  /// given an id; return a user
  Future<Either<Failure, AppUser>> getUserById(String id);

  /// given an email; return a user

  Future<Either<Failure, AppUser>> getUserByEmail(EmailAddress emailAddress);

  /// given a username; return a user;
  Future<Either<Failure, AppUser>> getUserByUsername(Username username);
}
