import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moments_app/domain/app_user/app_user.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';
import 'package:moments_app/domain/auth/auth_failure.dart';
import '../app_user/app_user_dto.dart';
import '../core/firebase_firestore_mapper.dart';

class AuthFacadeImpl implements AuthFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthFacadeImpl(this._firebaseAuth, this._firestore);

  @override
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else if (e.code == "user-disabled") {
        return left(const AuthFailure.accountDisabled());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<AppUser?> get currentUser => _firestore
      .userDoc()
      .get()
      .then((value) => AppUserDto.fromJson(value.data()!).toDomain());

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
