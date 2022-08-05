import 'package:elred/domain/entities/todo/user.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';

class SocialAuthModel {
  final AuthCredential credential;
  final u.User user;

  SocialAuthModel(
      {required this.credential, required this.user});
}
