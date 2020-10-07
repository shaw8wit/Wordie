import 'package:dartz/dartz.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/usecase/usecase.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import '../repositories/word_repo.dart';
import 'package:equatable/equatable.dart';

class GetConcreteWordList implements UseCase<Word, NoParams> {
  final WordRepo repo;

  GetConcreteWordList(this.repo);

  @override
  Future<Either<Failure, List<Word>>> call() async {
    return await repo.getWordList();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
