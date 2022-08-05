import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class DeleteTodoUseCase extends UseCase<Unit, String> {
  final TodoDataRepository _todoDataRepository;

  DeleteTodoUseCase(this._todoDataRepository);
  @override
  Future<Either<AppError, Unit>> call(String params) {
    return _todoDataRepository.deleteTodo(params);
  }
}
