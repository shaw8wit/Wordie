import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/usecase/usecase.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

import '../repositories/word_repo.dart';

class GetWordList implements UseCase<List<Word>, NoParams> {
  final WordRepo repo;

  GetWordList(this.repo);

  @override
  Future<Either<Failure, List<Word>>> call(NoParams params) async {
    return await repo.getWordList();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
