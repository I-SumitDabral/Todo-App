import 'package:dartz/dartz.dart';
import 'package:elred/data/models/social_auth_model.dart';
import 'package:elred/domain/entities/todo/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthClient {
  final GoogleSignIn googleSignIn;

  SocialAuthClient({required this.googleSignIn});

  Future<SocialAuthModel> googleAuthentication() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final u.User user = u.User(
        userID: googleSignInAccount.id,
        userTitle: googleSignInAccount.displayName.toString(),
        userImageUrl: googleSignInAccount.photoUrl ?? "");
    return SocialAuthModel(credential: credential, user: user);
  }

  Future<Unit> logout() async {
    await googleSignIn.signOut();
    return unit;
  }
}
