import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';

class ShowOrHideUseCase implements UseCase<dynamic, bool>{
  @override
  Future<Either<AppError, dynamic>> call(bool value) {
    // TODO: implement call
    throw UnimplementedError();
  }

}