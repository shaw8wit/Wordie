import 'package:meta/meta.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

class WordDetailsModel extends Word {
  WordDetailsModel({
    @required String word,
    @required id,
    @required description,
    @required example,
    @required url,
    @required score,
    @required favourite,
  }) : super(
          word: word,
          id: id,
          description: description,
          example: example,
          url: url,
          score: score,
          favourite: favourite,
        );
}
