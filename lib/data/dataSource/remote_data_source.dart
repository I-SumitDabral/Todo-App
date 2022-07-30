import 'dart:convert';

import 'package:elred/data/core/clients/firebase_auth_client.dart';
import 'package:elred/data/core/clients/firebase_client.dart';
import 'package:elred/data/core/clients/social_auth_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseRemoteDataSouce {
  Future<dynamic> fetchTodoList();
  Future<dynamic> initaiteLoginWithGoogle();
  Future<dynamic> login(AuthCredential creds);
  Future<dynamic> createOrdUpdateUser(Map user);
  Future<dynamic> getCurrentUser();
}

class FirebaseRemoteDataSouceImpl implements FirebaseRemoteDataSouce {
  final SocialAuthClient _socialAuthClient;
  final FirebaseClient _firebaseClient;
  final FirebaseAuthClient _firebaseAuthClient;

  FirebaseRemoteDataSouceImpl(
      this._socialAuthClient, this._firebaseClient, this._firebaseAuthClient);
  @override
  Future fetchTodoList() {
    // TODO: implement fetchTodoList
    throw UnimplementedError();
  }

  @override
  Future login(AuthCredential creds) async {
    await _firebaseAuthClient.attemptLogin(creds);
  }

  @override
  Future initaiteLoginWithGoogle() async {
    final response = await _socialAuthClient.googleAuthentication();
    return response;
  }

  @override
  Future createOrdUpdateUser(Map<dynamic, dynamic> user) async {
    final response = await _firebaseClient.post(
        json.encode(user) as Map<String, String>, user['user']['uid']);
  }

  @override
  Future getCurrentUser() async {
    final response = await _firebaseAuthClient.getLoggedInUser();
    return response;
  }
}
