import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:wordie/core/error/exceptions.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/platform/network_info.dart';
import 'package:wordie/features/word_list/data/datasources/word_local_data_source.dart';
import 'package:wordie/features/word_list/data/datasources/word_remote_data_source.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';

class WordRepoImpl implements WordRepo {
  final WordRemoteDataSource remoteDataSource;
  final WordLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WordRepoImpl({@required this.remoteDataSource, @required this.localDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, Word>> getWordDetails(String word) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWord = await remoteDataSource.getWordDetails(word);
        localDataSource.cachedWordDetails(remoteWord);
        return Right(remoteWord);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWord = await localDataSource.getLastWordDetails();
        return Right(localWord);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Word>>> getWordList() {
    return null;
  }
}
