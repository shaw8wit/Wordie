import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

import '../repositories/word_repo.dart';

class GetConcreteWordList {
  final WordRepo repo;

  GetConcreteWordList(this.repo);

  Future<Either<Failure, List<Word>>> call() async {
    return await repo.getWordList();
  }
}
