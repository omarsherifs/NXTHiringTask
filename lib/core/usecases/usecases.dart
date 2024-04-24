import 'package:dartz/dartz.dart';
import 'package:nxthiringtask/core/errors/error.dart';

abstract class BaseUseCase<T> {
  Future<Either<T, AppError>> call();
}
