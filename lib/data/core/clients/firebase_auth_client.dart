import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthClient(this._firebaseAuth);

  Future<dynamic> attemptLogin(AuthCredential userCredential) async {
    final response = await _firebaseAuth.signInWithCredential(userCredential);
    return response;
  }

  Future<dynamic> getLoggedInUser() async {
    final user = _firebaseAuth.currentUser;
    return user;
  }
}
