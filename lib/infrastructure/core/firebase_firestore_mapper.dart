import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moments_app/injections.dart';

extension FirebaseFirestoreMapperX on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> userDoc() {
    final authFacade = getIt<FirebaseAuth>();
    final firestore = getIt<FirebaseFirestore>();
    return firestore.collection("users").doc(authFacade.currentUser!.uid);
  }
}
