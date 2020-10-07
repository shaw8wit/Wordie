import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/usecase/usecase.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import '../repositories/word_repo.dart';

class Params extends Equatable {
  final String id;

  Params(this.id);

  @override
  List<Object> get props => [id];
}

class GetWordDetails implements UseCase<Word, String> {
  final WordRepo repo;

  GetWordDetails(this.repo);

  @override
  Future<Either<Failure, Word>> call() async {
    return await repo.getWordList();
  }
}
