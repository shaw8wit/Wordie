import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/core/error/exceptions.dart';
import 'package:wordie/core/error/failure.dart';
import 'package:wordie/core/network/network_info.dart';
import 'package:wordie/features/word_list/data/datasources/word_local_data_source.dart';
import 'package:wordie/features/word_list/data/datasources/word_remote_data_source.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';
import 'package:wordie/features/word_list/data/repositories/word_repository_impl.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

class MockRemoteDataSource extends Mock implements WordRemoteDataSource {}

class MockLocalDataSource extends Mock implements WordLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  WordRepoImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    repository = WordRepoImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getWordDetails', () {
    final word = 'dead';
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
          synonyms: ["deceased", "expired", "departed", "gone", "no more", "passed on", "passed away"],
        )
      ],
      score: 0,
      favourite: false,
    );
    final Word tWord = tWordDetailsModel;

    test('should check if device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getWordDetails(word);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getWordDetails(any)).thenAnswer((_) async => tWordDetailsModel);
        // act
        final result = await repository.getWordDetails(word);
        // assign
        verify(mockRemoteDataSource.getWordDetails(word));
        expect(result, Right(tWord));
      });

      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getWordDetails(any)).thenAnswer((_) async => tWordDetailsModel);
        // act
        await repository.getWordDetails(word);
        // assign
        verify(mockRemoteDataSource.getWordDetails(word));
        verify(mockLocalDataSource.cachedWordDetails(tWordDetailsModel));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockRemoteDataSource.getWordDetails(any)).thenThrow(ServerException());
        // act
        final result = await repository.getWordDetails(word);
        // assign
        verify(mockRemoteDataSource.getWordDetails(word));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOffline(() {
      test('should return last locally cached data when the cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getLastWordDetails()).thenAnswer((_) async => tWordDetailsModel);
        // act
        final result = await repository.getWordDetails(word);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWordDetails());
        expect(result, equals(Right(tWord)));
      });

      test('should return CacheFailure when no cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getLastWordDetails()).thenThrow(CacheException());
        // act
        final result = await repository.getWordDetails(word);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWordDetails());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('getWordList', () {
    final tWordDetailsModelList = [
      WordDetailsModel(
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
            synonyms: ["deceased", "expired", "departed", "gone", "no more", "passed on", "passed away"],
          )
        ],
        score: 0,
        favourite: false,
      )
    ];
    final List<Word> tWordList = tWordDetailsModelList;

    test('should check if device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getWordList();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getWordList()).thenAnswer((_) async => tWordDetailsModelList);
        // act
        final result = await repository.getWordList();
        // assign
        verify(mockRemoteDataSource.getWordList());
        expect(result, Right(tWordList));
      });

      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockRemoteDataSource.getWordList()).thenAnswer((_) async => tWordDetailsModelList);
        // act
        await repository.getWordList();
        // assign
        verify(mockRemoteDataSource.getWordList());
        verify(mockLocalDataSource.cachedWordList(tWordDetailsModelList));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockRemoteDataSource.getWordList()).thenThrow(ServerException());
        // act
        final result = await repository.getWordList();
        // assign
        verify(mockRemoteDataSource.getWordList());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOffline(() {
      test('should return last locally cached data when the cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getLastWordList()).thenAnswer((_) async => tWordDetailsModelList);
        // act
        final result = await repository.getWordList();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWordList());
        expect(result, equals(Right(tWordDetailsModelList)));
      });

      test('should return CacheFailure when no cached data is present', () async {
        // arrange
        when(mockLocalDataSource.getLastWordList()).thenThrow(CacheException());
        // act
        final result = await repository.getWordList();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastWordList());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
