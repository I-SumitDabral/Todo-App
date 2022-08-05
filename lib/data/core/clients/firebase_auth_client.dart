import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthClient(this._firebaseAuth);

  Future<dynamic> attemptLogin(AuthCredential userCredential) async {
    final response = await _firebaseAuth.signInWithCredential(userCredential);
    return response;
  }

  Future<dynamic> getLoggedInUser() async {
    final userID = _firebaseAuth.currentUser?.uid;
    return userID;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
