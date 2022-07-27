import 'package:elred/data/core/clients/firebase_client.dart';
import 'package:elred/data/core/clients/social_auth_client.dart';

abstract class FirebaseRemoteDataSouce {
  Future<dynamic> fetchTodoList();
}

class FirebaseRemoteDataSouceImpl implements FirebaseRemoteDataSouce {
  final SocialAuthClient _socialAuthClient;
  final FirebaseClient _firebaseClient;

  FirebaseRemoteDataSouceImpl(this._socialAuthClient, this._firebaseClient);
  @override
  Future fetchTodoList() {
    // TODO: implement fetchTodoList
    throw UnimplementedError();
  }
}
