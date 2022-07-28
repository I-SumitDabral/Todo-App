import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, dynamic>> createOrUpdateUser(Map<String, dynamic> params);
}
