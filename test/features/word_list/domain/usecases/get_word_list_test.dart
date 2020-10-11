import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';
import 'package:wordie/features/word_list/domain/usecases/get_word_list.dart';

class MockWordListRepository extends Mock implements WordRepo {}

void main() {
  GetWordList usecase;
  MockWordListRepository mockWordListRepository;

  setUp(() {
    mockWordListRepository = MockWordListRepository();
    usecase = GetWordList(mockWordListRepository);
  });

  final List<Word> wordList = [
    Word(
      word: 'dead',
      pronunciation: '/dɛd/',
      audio: 'https://lex-audio.useremarkable.com/mp3/dead_us_1.mp3',
      soundsLike: ['ded', 'dde', 'ddc', 'ddg', 'did'],
      spelledLike: [],
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
    ),
  ];

  test(
    'should get word list',
    () async {
      // arrange
      when(mockWordListRepository.getWordList()).thenAnswer((_) async => Right(wordList));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(wordList));
      verify(mockWordListRepository.getWordList());
      verifyNoMoreInteractions(mockWordListRepository);
    },
  );
}
