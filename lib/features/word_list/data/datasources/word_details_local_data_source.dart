import 'package:wordie/features/word_list/data/models/word_details_model.dart';

abstract class WordLocalDataSource {
  /// Gets the cached [WordDetailsModel] which was fetched
  /// the last time there was internet connection.
  ///
  /// Throws [CachedException] if no cached data is present.
  Future<WordDetailsModel> getLastWordDetails();

  Future<void> cachedWordDetails(WordDetailsModel wordToCache);

  Future<List<WordDetailsModel>> getLastWordList();

  Future<void> cachedWordList(WordDetailsModel wordToCache);
}
