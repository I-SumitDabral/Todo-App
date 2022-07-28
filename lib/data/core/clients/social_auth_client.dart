import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthClient {
  final GoogleSignIn googleSignIn;

  SocialAuthClient({required this.googleSignIn});

  Future<Map<String, dynamic>> googleAuthentication() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return {
      "credential": credential,
      'googleSignInAccount': googleSignInAccount
    };
  }

  Future<Unit> logout() async {
    await googleSignIn.signOut();
    return unit;
  }
}
