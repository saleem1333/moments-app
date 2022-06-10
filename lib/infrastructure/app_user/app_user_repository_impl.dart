import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moments_app/domain/auth/auth_failure.dart';

import 'package:moments_app/domain/app_user/app_user.dart';

import 'package:dartz/dartz.dart';

import '../../domain/app_user/app_user_repository.dart';
import 'app_user_dto.dart';

class AppUserRepositoryImpl implements AppUserRepository {
  const AppUserRepositoryImpl(this._firestore, this._firebaseAuth);
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  @override
  Future<Either<AuthFailure, Unit>> createUser(AppUser user) async {
    try {
      final appUserDto = AppUserDto.fromDomain(user);
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: appUserDto.email, password: appUserDto.password);

      await _firestore
          .collection("users")
          .doc(user.id)
          .set(appUserDto.toJson());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e.code == "weak-password") {
        return left(const AuthFailure.weakPassword());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
}
