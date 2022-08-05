import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseClient {
  final FirebaseFirestore firebaseFirestore;

  FirebaseClient({required this.firebaseFirestore});

  Stream<QuerySnapshot<Map<String, dynamic>>> get(
    String path,
  ) async* {
    final collection = firebaseFirestore.collection(path);
    yield* collection.snapshots();
  }

  Future<Unit> post(
      Map<String, dynamic> params, String todoID, String userID) async {
    await firebaseFirestore.collection(userID).doc(todoID).set(params);
    return unit;
  }

  Future<Unit> update(
      Map<String, dynamic> params, String todoID, String userID) async {
    await firebaseFirestore.collection(userID).doc(todoID).update(params);
    return unit;
  }

  Future<Unit> delete(
       String todoID, String userID) async {
    await firebaseFirestore.collection(userID).doc(todoID).delete();
    return unit;
  }
}
