import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/common/config/firebase_path.dart';
import 'package:elred/data/core/clients/firebase_auth_client.dart';
import 'package:elred/data/core/clients/firebase_client.dart';
import 'package:elred/data/core/clients/social_auth_client.dart';
import 'package:elred/data/models/social_auth_model.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRemoteDataSouce {
  Future<dynamic> initaiteLoginWithGoogle();
  Future<void> logout();
  Future<Unit> login(AuthCredential creds);
  Future<Unit> createOrdUpdateUser(Map<String, dynamic> user);
  Future<dynamic> getCurrentUser();
  Future<Unit> addNewTodo(Map<String, dynamic> body);
  Future<Unit> updateTodo(Map<String, dynamic> body);
  Future<Unit> deleteTodo(String todoID);
  Stream<Either<AppError, List<Todo>>> getTodos();
}

class FirebaseRemoteDataSouceImpl implements FirebaseRemoteDataSouce {
  final SocialAuthClient _socialAuthClient;
  final FirebaseClient _firebaseClient;
  final FirebaseAuthClient _firebaseAuthClient;

  FirebaseRemoteDataSouceImpl(
      this._socialAuthClient, this._firebaseClient, this._firebaseAuthClient);

  @override
  Future<Unit> login(AuthCredential creds) async {
    await _firebaseAuthClient.attemptLogin(creds);
    return unit;
  }

  @override
  Future<SocialAuthModel> initaiteLoginWithGoogle() async {
    final response = await _socialAuthClient.googleAuthentication();
    return response;
  }

  @override
  Future<Unit> createOrdUpdateUser(Map<String, dynamic> user) async {
    await _firebaseClient.post(user, user['userID'], FirebasePath.user);
    return unit;
  }

  @override
  Future getCurrentUser() async {
    final response = await _firebaseAuthClient.getLoggedInUser();
    return response;
  }

  @override
  Future<Unit> addNewTodo(Map<String, dynamic> body) async {
    final userID = await _firebaseAuthClient.getLoggedInUser();
    await _firebaseClient.post(body, body['todoID'], userID);
    return unit;
  }

  @override
  Stream<Either<AppError, List<Todo>>> getTodos() async* {
    final userId = await _firebaseAuthClient.getLoggedInUser();
    final collection = FirebaseFirestore.instance
        .collection(userId!)
        .snapshots()
        .map((event) => right<AppError, List<Todo>>(event.docs.map((e) {
              return Todo.fromJson(e.data());
            }).toList()));
    yield* collection;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuthClient.logout();
    await _socialAuthClient.logout();
  }

  @override
  Future<Unit> updateTodo(Map<String, dynamic> body) async {
    final userID = await _firebaseAuthClient.getLoggedInUser();
    await _firebaseClient.update(body, body['todoID'], userID);
    return unit;
  }

  @override
  Future<Unit> deleteTodo(String todoID) async {
    final userID = await _firebaseAuthClient.getLoggedInUser();
    await _firebaseClient.delete(todoID, userID);
    return unit;
  }
}
