import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/app_user/app_user.dart';

import '../auth/auth_failure.dart';

abstract class AppUserRepository {
  // create a new user
  Future<Either<AuthFailure, Unit>> createUser(AppUser user);
}
