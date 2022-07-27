import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthClient {
  final GoogleSignIn googleSignIn;

  SocialAuthClient({required this.googleSignIn});

  Future<GoogleSignInAccount?> googleAuthentication() async {
    final response = await googleSignIn.signIn();
    return response;
  }

  Future<Unit> logout() async {
    await googleSignIn.signOut();
    return unit;
  }
}
