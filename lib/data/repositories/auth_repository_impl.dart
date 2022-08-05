import 'dart:io';

import 'package:elred/data/core/enums/app_error_enums.dart';
import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/todo/user.dart' as u;
import 'package:elred/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseRemoteDataSouce _firebaseRemoteDataSouce;

  AuthenticationRepositoryImpl(this._firebaseRemoteDataSouce);
  @override
  Future<Either<AppError, Unit>> login(Map<String, String> authParams) async {
    final response = await _firebaseRemoteDataSouce.initaiteLoginWithGoogle();
    final credential = response.credential;
    final u.User account = response.user;
    await _firebaseRemoteDataSouce.login(credential);
    await _firebaseRemoteDataSouce.createOrdUpdateUser(account.toJson());
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> getCurrentUser() async {
    final response = await _firebaseRemoteDataSouce.getCurrentUser();
    if (response != null) {
      return right(unit);
    }
    return left(response);
  }

  @override
  Future<Either<AppError, Unit>> logout() async {
    try {
      await _firebaseRemoteDataSouce.logout();
      return right(unit);
    } on SocketException catch (_) {
      return left(const AppError(AppErrorType.network));
    } catch (_) {
      return left(const AppError(AppErrorType.database));
    }
  }
}
