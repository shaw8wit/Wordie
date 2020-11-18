import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';

import '../../../../../lib/features/word_list/data/datasources/word_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  WordLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = WordLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getLastWord', () {
    final tWordDetailsModelOrig = WordDetailsModel(
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
    final tWordDetailsModel = WordDetailsModel.fromBuiltJson(tWordDetailsModelOrig.toJson());

    test('should return WordDetailsModel from sharedPreferences when there is one in cache', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode(tWordDetailsModelOrig.toJson()));
      // act
      final result = await dataSource.getLastWordDetails();
      // assert
      verify(mockSharedPreferences.getString('CACHED_WORD_DETAILS'));
      expect(result, equals(tWordDetailsModel));
    });
  });
}
