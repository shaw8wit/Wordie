import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';
import 'package:wordie/features/word_list/domain/usecases/get_concrete_word_list.dart';

class MockWordListRepository extends Mock implements WordRepo {}

void main() {
  GetConcreteWordList usecase;
  MockWordListRepository mockWordListRepository;

  setUp(() {
    mockWordListRepository = MockWordListRepository();
    usecase = GetConcreteWordList(mockWordListRepository);
  });

  final List<Word> wordList = [
    Word(
      title: 'fam',
      id: '1',
      description: 'its ma fam',
      example: 'fam call',
      url: 'fam url',
      score: 0,
      favourite: false,
    ),
  ];

  test(
    'should get word list',
    () async {
      // arrange
      when(mockWordListRepository.getWordList())
          .thenAnswer((_) async => Right(wordList));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(wordList));
      verify(mockWordListRepository.getWordList());
      verifyNoMoreInteractions(mockWordListRepository);
    },
  );
}
