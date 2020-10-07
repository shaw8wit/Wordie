import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call();
}
