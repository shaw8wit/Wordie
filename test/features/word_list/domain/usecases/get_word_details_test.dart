import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';
import 'package:wordie/features/word_list/domain/repositories/word_repo.dart';
import 'package:wordie/features/word_list/domain/usecases/get_concrete_word_list.dart';

class MockWordListRepository extends Mock implements WordRepo {}

void main() {
  GetWordDetails usecase;
  MockWordListRepository mockWordListRepository;

  setUp(() {
    mockWordListRepository = MockWordListRepository();
    usecase = GetWordDetails(mockWordListRepository);
  });

  final String id = '1';
  final Word wordDetails = Word(
    title: 'fam',
    id: '1',
    description: 'its ma fam',
    example: 'fam call',
    url: 'fam url',
    score: 0,
    favourite: false,
  );

  test(
    'should get matching word',
    () async {
      // arrange
      when(mockWordListRepository.getWordDetails(String id))
          .thenAnswer((_) async => Right(wordDetails));
      // act
      final result = await usecase(Params(id));
      // assert
      expect(result, Right(wordDetails));
      verify(mockWordListRepository.getWordList());
      verifyNoMoreInteractions(mockWordListRepository);
    },
  );
}
