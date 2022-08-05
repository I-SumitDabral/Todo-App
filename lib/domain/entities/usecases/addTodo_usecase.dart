import 'package:dartz/dartz.dart' show Either, Unit;
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class AddTodoUseCase extends UseCase<Unit, Todo> {
  final TodoDataRepository _todoDataRepository;

  AddTodoUseCase(this._todoDataRepository);
  @override
  Future<Either<AppError, Unit>> call(Todo params) {
    return _todoDataRepository.addNewTodo(params.toJson());
  }
}
