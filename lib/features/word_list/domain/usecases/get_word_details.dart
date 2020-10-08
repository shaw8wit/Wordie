import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/usecase/usecase.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

import '../repositories/word_repo.dart';

class Params extends Equatable {
  final String word;

  Params({@required this.word});

  @override
  List<Object> get props => [word];
}

class GetWordDetails implements UseCase<Word, Params> {
  final WordRepo repo;

  GetWordDetails(this.repo);

  @override
  Future<Either<Failure, Word>> call(Params params) async {
    return await repo.getWordDetails(params.word);
  }
}
