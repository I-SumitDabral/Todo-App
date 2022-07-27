import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';

abstract class TodoDataRepository {
    Future<Either<AppError, dynamic>> getTodoList(String userID);
  Future<Either<AppError, dynamic>> addNewTodo(Map<String, String> todoParams);
  Future<Either<AppError, dynamic>> deleteTodo(String todoID);
}
