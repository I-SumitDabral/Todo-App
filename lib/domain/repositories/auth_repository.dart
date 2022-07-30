import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, dynamic>> login(Map<String, String> authParams);
  Future<Either<AppError, dynamic>> getCurrentUser();
}
