import 'dart:io';
import 'package:elred/data/core/enums/app_error_enums.dart';
import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class TodoDataRepositoryImpl implements TodoDataRepository {
  final FirebaseRemoteDataSouce _firebaseRemoteDataSouce;

  TodoDataRepositoryImpl(this._firebaseRemoteDataSouce);
  @override
  Future<Either<AppError, Unit>> addNewTodo(
      Map<String, dynamic> todoParams) async {
    try {
      final response = await _firebaseRemoteDataSouce.addNewTodo(todoParams);
      return right(response);
    } on SocketException catch (_) {
      return left(const AppError(AppErrorType.network));
    } catch (_) {
      return left(const AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteTodo(String todoID) async {
    try {
      await _firebaseRemoteDataSouce.deleteTodo(todoID);
      return right(unit);
    } on SocketException catch (_) {
      return left(const AppError(AppErrorType.network));
    } catch (_) {
      return left(const AppError(AppErrorType.database));
    }
  }

  @override
  Stream<Either<AppError, List<Todo>>> getTodoList() async* {
    try {
      final response = _firebaseRemoteDataSouce.getTodos();
      yield* response;
    } on SocketException catch (_) {
      yield left(const AppError(AppErrorType.network));
    } catch (error) {
      yield left(const AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, Unit>> updateTodo(
      Map<String, dynamic> todoParams) async {
    try {
      final response = await _firebaseRemoteDataSouce.addNewTodo(todoParams);
      return right(response);
    } on SocketException catch (_) {
      return left(const AppError(AppErrorType.network));
    } catch (_) {
      return left(const AppError(AppErrorType.database));
    }
  }
}
