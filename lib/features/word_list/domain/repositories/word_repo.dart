import 'package:dartz/dartz.dart';

abstract class WordRepo {
  Future<Either<Failure, Word>> getWord(int id);
}