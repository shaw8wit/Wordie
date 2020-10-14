import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  /// base Usecase call function
  Future<Either<Failure, Type>> call(Params params);
}
