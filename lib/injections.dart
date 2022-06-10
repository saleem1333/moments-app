import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:moments_app/domain/auth/auth_facade.dart';
import 'package:moments_app/infrastructure/auth/auth_facade_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthFacade>(
      AuthFacadeImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()));
}
