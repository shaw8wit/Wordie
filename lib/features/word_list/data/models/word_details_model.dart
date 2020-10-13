import 'dart:math';

import 'package:meta/meta.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';
import 'package:wordie/features/word_list/domain/entities/word.dart';

class WordDetailsModel extends Word {
  WordDetailsModel({
    @required word,
    @required pronunciation,
    @required audio,
    @required soundsLike,
    @required spelledLike,
    @required frequency,
    @required partOfSpeech,
    @required score,
    @required favourite,
  }) : super(
          word: word,
          pronunciation: pronunciation,
          audio: audio,
          soundsLike: soundsLike,
          spelledLike: spelledLike,
          frequency: frequency,
          partOfSpeech: partOfSpeech,
          score: score,
          favourite: favourite,
        );

  factory WordDetailsModel.fromJson(
    List<dynamic> wordJsonMap,
    List<dynamic> spelledLikeFrequencyJsonMap,
    List<dynamic> soundLikeJsonMap,
  ) {
    final List<String> soundsLike = List<String>.from(soundLikeJsonMap.map((e) => e['word']));
    final List<String> spelledLike = List<String>.from(spelledLikeFrequencyJsonMap.map((e) => e['word']));
    final List<PartOfSpeech> partOfSpeech = new List<PartOfSpeech>();
    for (int i = 0; i < wordJsonMap[0]['meanings'].length; i++) {
      String pos = wordJsonMap[0]['meanings'][i]['partOfSpeech'];
      for (int j = 0; j < wordJsonMap[0]['meanings'][i]['definitions'].length; j++) {
        List<String> syn;
        if (wordJsonMap[0]['meanings'][i]['definitions'][j]['synonyms'] != null) {
          syn = List<String>.from(
              wordJsonMap[0]['meanings'][i]['definitions'][j]['synonyms'].map((e) => e as String));
        } else {
          syn = List<String>();
        }
        partOfSpeech.add(PartOfSpeech(
          type: pos,
          definition: wordJsonMap[0]['meanings'][i]['definitions'][j]['definition'],
          example: wordJsonMap[0]['meanings'][i]['definitions'][j]['example'],
          synonyms: syn.sublist(0, min(syn.length, 5)),
        ));
      }
    }
    return WordDetailsModel(
      word: wordJsonMap[0]['word'],
      pronunciation: wordJsonMap[0]['phonetics'][0]['text'],
      audio: wordJsonMap[0]['phonetics'][0]['audio'],
      soundsLike: soundsLike.sublist(1),
      spelledLike: spelledLike.sublist(1),
      frequency: double.parse(spelledLikeFrequencyJsonMap[0]['tags'][0].substring(2)).round(),
      partOfSpeech: partOfSpeech,
      score: 0,
      favourite: false,
    );
  }
}
