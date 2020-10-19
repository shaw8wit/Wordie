import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wordie/core/platform/network_info.dart';
import 'package:wordie/features/word_list/data/datasources/word_details_local_data_source.dart';
import 'package:wordie/features/word_list/data/datasources/word_remote_data_source.dart';
import 'package:wordie/features/word_list/data/repositories/word_repo_impl.dart';

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
}
