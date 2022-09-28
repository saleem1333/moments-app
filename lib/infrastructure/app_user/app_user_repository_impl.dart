import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moments_app/domain/app_user/value_objects.dart';
import 'package:moments_app/domain/auth/auth_failure.dart';

import 'package:moments_app/domain/app_user/app_user.dart';

import 'package:dartz/dartz.dart';
import 'package:moments_app/domain/auth/value_objects.dart';
import 'package:moments_app/domain/core/failure.dart';
import 'package:moments_app/infrastructure/core/firestore_collections.dart';

import '../../domain/app_user/app_user_repository.dart';
import 'app_user_dto.dart';

class AppUserRepositoryImpl implements AppUserRepository {
  const AppUserRepositoryImpl(this._firestore, this._firebaseAuth);
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  @override
  Future<Either<AuthFailure, Unit>> createUser(AppUser user) async {
    try {
      final Either<Failure, AppUser> userWithEmail =
          await getUserByEmail(user.emailAddress);
      final bool userWithEmailExists = userWithEmail.isRight();

      if (userWithEmailExists) {
        return left(const AuthFailure.emailAlreadyInUse());
      }

      final Either<Failure, AppUser> userWithUsername =
          await getUserByUsername(user.username);
      final bool userWithUsernameExists = userWithUsername.isRight();

      if (userWithUsernameExists) {
        return left(AuthFailure.usernameAlreadyInUse());
      }

      final appUserDto = AppUserDto.fromDomain(user);
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: appUserDto.email, password: appUserDto.password);
      await _firestore
          .collection(FirestoreCollections.users)
          .doc(credentials.user!.uid)
          .set(appUserDto.toJson());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return left(const AuthFailure.weakPassword());
      } else {
        log(e.message!);
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserById(String id) async {
    try {
      final doc = _firestore.collection(FirestoreCollections.users).doc(id);
      final ref = await doc.get();
      if (!ref.exists) {
        return left(const Failure("No user with such id exists"));
      }
      return right(AppUserDto.fromJson(ref.data()!).toDomain());
    } on Exception {
      return left(Failure("cannot fetch user"));
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserByEmail(
      EmailAddress emailAddress) async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreCollections.users)
          .where("email", isEqualTo: emailAddress.getOrCrash())
          .get();
      if (snapshot.docs.isEmpty) {
        return left(Failure("No user with such email"));
      }

      assert(snapshot.size == 1,
          "Multiple users with the same email have been detected");

      return right(AppUserDto.fromJson(snapshot.docs.first.data()).toDomain());
    } on Exception catch (e) {
      log(e.toString());
      return left(Failure("Something unexpected happened"));
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserByUsername(Username username) async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreCollections.users)
          .where("username", isEqualTo: username.getOrCrash())
          .get();
      if (snapshot.docs.isEmpty) {
        return left(Failure("No user with such username"));
      }

      assert(snapshot.size == 1,
          "Multiple users with the same username have been detected");

      return right(AppUserDto.fromJson(snapshot.docs.first.data()).toDomain());
    } on Exception catch (e) {
      log(e.toString());
      return left(Failure("Something unexpected happened"));
    }
  }
}
