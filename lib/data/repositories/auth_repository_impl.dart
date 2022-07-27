import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  @override
  Future<Either<AppError, dynamic>> login(Map<String, String> authParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, dynamic>> register(Map<String, String> authParams) {
    // TODO: implement register
    throw UnimplementedError();
  }

}