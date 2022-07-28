import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<AppError, U>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as AppError;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
