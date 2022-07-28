import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseRemoteDataSouce _firebaseRemoteDataSouce;

  AuthenticationRepositoryImpl(this._firebaseRemoteDataSouce);
  @override
  Future<Either<AppError, dynamic>> login(
      Map<String, String> authParams) async {
    final response = await _firebaseRemoteDataSouce.initaiteLoginWithGoogle();
    final response2 =
        await _firebaseRemoteDataSouce.login(response['credential']);
    print('12345 $response');
    final response3 = await _firebaseRemoteDataSouce
        .createOrdUpdateUser(response['googleSignInAccount']);
    return right(unit);
  }

  @override
  Future<Either<AppError, dynamic>> register(Map<String, String> authParams) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
