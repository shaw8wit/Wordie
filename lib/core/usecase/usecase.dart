import 'package:dartz/dartz.dart';
import

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}