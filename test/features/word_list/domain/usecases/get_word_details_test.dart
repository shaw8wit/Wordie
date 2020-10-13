import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';
import 'package:wordie/features/word_list/domain/usecases/get_word_details.dart';

class MockWordDetailsRepository extends Mock implements WordRepo {}

void main() {
  GetWordDetails usecase;
  MockWordDetailsRepository mockWordDetailsRepository;

  setUp(() {
    mockWordDetailsRepository = MockWordDetailsRepository();
    usecase = GetWordDetails(mockWordDetailsRepository);
  });

  final String word = 'dead';
  final Word wordDetails = Word(
    word: 'dead',
    pronunciation: '/dɛd/',
    audio: 'https://lex-audio.useremarkable.com/mp3/dead_us_1.mp3',
    soundsLike: ['ded', 'dde', 'ddc', 'ddg', 'did'],
    spelledLike: [],
    frequency: 146,
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

  test(
    'should get matching word',
    () async {
      // arrange
      when(mockWordDetailsRepository.getWordDetails(any)).thenAnswer((_) async => Right(wordDetails));
      // act
      final result = await usecase(Params(word: word));
      // assert
      expect(result, Right(wordDetails));
      verify(mockWordDetailsRepository.getWordDetails(word));
      verifyNoMoreInteractions(mockWordDetailsRepository);
    },
  );
}
