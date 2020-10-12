import 'package:meta/meta.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

class WordDetailsModel extends Word {
  WordDetailsModel({
    @required word,
    @required pronunciation,
    @required audio,
    @required soundsLike,
    @required spelledLike,
    @required frequency,
    @required partOfSpeech,
    @required score,
    @required favourite,
  }) : super(
          word: word,
          pronunciation: pronunciation,
          audio: audio,
          soundsLike: soundsLike,
          spelledLike: spelledLike,
          frequency: frequency,
          partOfSpeech: partOfSpeech,
          score: score,
          favourite: favourite,
        );

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) {
    //TODO
  }
}
