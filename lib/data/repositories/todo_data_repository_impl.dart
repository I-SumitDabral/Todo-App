import 'package:elred/data/dataSource/remote_data_source.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class TodoDataRepositoryImpl implements TodoDataRepository {
  final FirebaseRemoteDataSouce _firebaseRemoteDataSouce;

  TodoDataRepositoryImpl(this._firebaseRemoteDataSouce);
  @override
  Future<Either<AppError, dynamic>> addNewTodo(Map<String, String> todoParams) {
    // TODO: implement addNewTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, dynamic>> deleteTodo(String todoID) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, dynamic>> getTodoList(String userID) {
    // TODO: implement getTodoList
    throw UnimplementedError();
  }
}
