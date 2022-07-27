import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseClient {
  final FirebaseFirestore firebaseFirestore;

  FirebaseClient({required this.firebaseFirestore});

  Future<dynamic> get(String path, String iD) async {
    final value =
        firebaseFirestore.collection(path).doc(iD).withConverter<dynamic>(
              fromFirestore: (snapshot, _) => snapshot,
              // FireBaseFavParams.fromJson(snapshot.data()!),
              toFirestore: (data, _) => data.toJson(),
            );
    final response = value.get().then((snapshot) => snapshot.data());
    return response;
  }

  Future<Unit> post(Map<String, String> params, String userID) async {
    return unit;
  }

  Future<Unit> delete(String userID, String todoID) async {
    return unit;
  }
}
