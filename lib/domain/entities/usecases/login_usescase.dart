import 'package:elred/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/usecases/usecase.dart';
import 'package:elred/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<Unit, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);
  @override
  Future<Either<AppError, Unit>> call(NoParams params) async {
    return _authenticationRepository.login({});
  }
}
