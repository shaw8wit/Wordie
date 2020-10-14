import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';

class WordRepoImpl implements WordRepo {
  @override
  Future<Either<Failure, Word>> getWordDetails(String word) {
    // TODO: implement getWordDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Word>>> getWordList() {
    // TODO: implement getWordList
    throw UnimplementedError();
  }
}
