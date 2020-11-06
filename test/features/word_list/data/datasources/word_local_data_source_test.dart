import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../lib/features/word_list/data/datasources/word_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  WordLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = WordLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });
}
