import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tWordDetailsModel = WordDetailsModel(
    word: 'dead',
    pronunciation: '/dɛd/',
    audio: 'https://lex-audio.useremarkable.com/mp3/dead_us_1.mp3',
    soundsLike: ['ded', 'dde', 'ddc', 'ddg', 'did'],
    spelledLike: <String>[],
    frequency: 146,
    partOfSpeech: [
      PartOfSpeech(
        type: 'adjective',
        definition: 'No longer alive.',
        example: 'a dead body',
        synonyms: ["deceased", "expired", "departed", "gone", "no more"],
      ),
      PartOfSpeech(
        type: 'adjective',
        definition: '(of a place or time) characterized by a lack of activity or excitement.',
        example: 'Brussels isn\'t dead after dark, if you know where to look',
        synonyms: ["uneventful", "uninteresting", "unexciting", "uninspiring", "dull"],
      ),
      PartOfSpeech(
        type: 'adjective',
        definition: '(of a piece of equipment) no longer functioning, especially because of a fault.',
        example: 'the phone had gone dead',
        synonyms: ["not working", "out of order", "out of commission", "inoperative", "inactive"],
      ),
      PartOfSpeech(
        type: 'adjective',
        definition: 'No longer current, relevant, or important.',
        example: 'pollution had become a dead issue',
        synonyms: <String>[],
      ),
      PartOfSpeech(
        type: 'adjective',
        definition: '(of sound) without resonance; dull.',
        example: 'the note sounds dead compared to all others on the keyboard',
        synonyms: <String>[],
      ),
      PartOfSpeech(
        type: 'adjective',
        definition: 'Complete; absolute.',
        example: 'we sat in dead silence',
        synonyms: ["complete", "absolute", "total", "entire", "outright"],
      ),
      PartOfSpeech(
        type: 'adverb',
        definition: 'Absolutely; completely.',
        example: 'you\'re dead right',
        synonyms: ["completely", "absolutely", "totally", "utterly", "deadly"],
      ),
    ],
    score: 0,
    favourite: false,
  );

  test('should be a subclass of WordDetails entity', () async {
    // assert
    expect(tWordDetailsModel, isA<Word>());
  });

  group('fromJson', () {
    test('should return a valid word model with no discrepancy', () async {
      // arrange
      final List<dynamic> wordJsonMap = json.decode(fixture('word.json'));
      final List<dynamic> spelledLikeFrequencyJsonMap = json.decode(fixture('spelledLike_freq_def.json'));
      final List<dynamic> soundLikeJsonMap = json.decode(fixture('soundLike.json'));
      // act
      final result = WordDetailsModel.fromJson(wordJsonMap, spelledLikeFrequencyJsonMap, soundLikeJsonMap);
      // assert
      expect(result, tWordDetailsModel);
    });
  });
}
