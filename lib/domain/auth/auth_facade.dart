import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/app_user/app_user.dart';

import 'auth_failure.dart';

/// Auth interface that defines the common behaviours of authentication
abstract class AuthFacade {

  /// login with an email and password
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password});

  /// get the current logged in user
  Future<AppUser?> get currentUser;

  // log out
  Future<void> signOut();
}
