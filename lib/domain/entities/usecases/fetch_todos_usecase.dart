import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class FetchTodosUseCase implements StreamedUseCase<List<Todo>, NoParams> {
  final TodoDataRepository _todoDataRepository;

  FetchTodosUseCase(this._todoDataRepository);
  @override
  Stream<Either<AppError, List<Todo>>> call(params) async* {
    yield* _todoDataRepository.getTodoList();
  }
}
