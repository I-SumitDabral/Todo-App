import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<Either<AppError, dynamic>> createOrUpdateUser(Map<String, dynamic> params) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

}