import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

abstract class WordRepo {
  Future<Either<Failure, List<Word>>> getWordList();
  Future<Either<Failure, Word>> getWordDetails(String word);
}
