import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class InjectableModules {
  GoogleSignIn get googleSignIn => GoogleSignIn();
  FirebaseFirestore get firebaseFireStore => FirebaseFirestore.instance;
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

class InjectableModulesImpl extends InjectableModules {}
