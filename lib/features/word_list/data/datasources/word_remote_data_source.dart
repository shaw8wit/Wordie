import 'package:wordie/features/word_list/domain/entities/word.dart';

abstract class WordRemoteDataSource {
  /// gets word list stored by users from database
  ///
  /// throws a [ServerException] for all error codes
  Future<List<Word>> getWordList();

  /// Calls the https://api.dictionaryapi.dev/api/v2/entries/en/{word},
  /// the http://api.datamuse.com/words?sl={word}&max=6,
  /// and the http://api.datamuse.com/words?sp={word}&md=fd&max=6 endpoints.
  ///
  /// throws a [ServerException] for all error codes.
  Future<Word> getWordDetails(String word);
}
