import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/todo/todo.dart';

abstract class TodoDataRepository {
  Stream<Either<AppError, List<Todo>>> getTodoList();
  Future<Either<AppError, Unit>> addNewTodo(Map<String, dynamic> todoParams);
  Future<Either<AppError, Unit>> updateTodo(Map<String, dynamic> todoParams);
  Future<Either<AppError, Unit>> deleteTodo(String todoID);
}
