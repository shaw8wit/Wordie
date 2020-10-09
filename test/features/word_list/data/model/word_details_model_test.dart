import 'package:flutter_test/flutter_test.dart';
import 'package:wordie/features/word_list/data/models/word_details_model.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

void main() {
  final tWordDetailsModel = WordDetailsModel(
    word: 'fam',
    id: '1',
    description: 'its ma fam',
    example: 'fam call',
    url: 'fam url',
    score: 0,
    favourite: false,
  );

  test('should be a subclass of WordDetails entity', () async {
    // assert
    expect(tWordDetailsModel, isA<Word>());
  });
}
