import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';
import 'package:elred/domain/repositories/todo_data_repository.dart';

class FetchTodosUseCase implements UseCase<dynamic, NoParams> {
  final TodoDataRepository _todoDataRepository;

  FetchTodosUseCase(this._todoDataRepository);
  @override
  Future<Either<AppError, dynamic>> call(params) async {
    return _todoDataRepository.getTodoList("userID");
  }
}
