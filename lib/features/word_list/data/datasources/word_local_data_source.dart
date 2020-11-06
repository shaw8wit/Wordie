import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';

abstract class WordLocalDataSource {
  /// Gets the cached [WordDetailsModel] which was fetched
  /// the last time there was internet connection.
  ///
  /// Throws [CachedException] if no cached data is present.
  Future<WordDetailsModel> getLastWordDetails();

  Future<void> cachedWordDetails(WordDetailsModel wordToCache);

  Future<List<WordDetailsModel>> getLastWordList();

  Future<void> cachedWordList(List<WordDetailsModel> wordListToCache);
}

class WordLocalDataSourceImpl implements WordLocalDataSource {
  final SharedPreferences sharedPreferences;

  WordLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cachedWordDetails(WordDetailsModel wordToCache) {
    // TODO: implement cachedWordDetails
    throw UnimplementedError();
  }

  @override
  Future<void> cachedWordList(List<WordDetailsModel> wordListToCache) {
    // TODO: implement cachedWordList
    throw UnimplementedError();
  }

  @override
  Future<WordDetailsModel> getLastWordDetails() {
    // TODO: implement getLastWordDetails
    throw UnimplementedError();
  }

  @override
  Future<List<WordDetailsModel>> getLastWordList() {
    // TODO: implement getLastWordList
    throw UnimplementedError();
  }
}
