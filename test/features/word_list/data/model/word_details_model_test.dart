import 'package:flutter_test/flutter_test.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

void main() {
  final tWordDetailsModel = WordDetailsModel(
    word: 'dead',
    pronunciation: '/dɛd/',
    audio: 'https://lex-audio.useremarkable.com/mp3/dead_us_1.mp3',
    soundsLike: ['ded', 'dde', 'ddc', 'ddg', 'did'],
    spelledLike: <String>[],
    frequency: 146.23,
    partOfSpeech: [
      PartOfSpeech(
        type: 'adjective',
        definition: 'No longer alive.',
        example: 'a dead body',
        synonyms: ["deceased", "expired", "departed", "gone", "no more", "passed on", "passed away"],
      )
    ],
    score: 0,
    favourite: false,
  );

  test('should be a subclass of WordDetails entity', () async {
    // assert
    expect(tWordDetailsModel, isA<Word>());
  });
}
