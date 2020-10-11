import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wordie/features/word_list/domain/entities/part_of_speech.dart';

class Word extends Equatable {
  final String word;
  final String pronunciation;
  final String audio;
  final List<String> soundsLike;
  final List<String> spelledLike;
  final double frequency;
  final List<PartOfSpeech> partOfSpeech;
  final int score;
  final bool favourite;

  Word({
    @required this.word,
    @required this.pronunciation,
    @required this.audio,
    @required this.soundsLike,
    @required this.spelledLike,
    @required this.frequency,
    @required this.partOfSpeech,
    @required this.score,
    @required this.favourite,
  });

  @override
  List<Object> get props => [
        word,
        pronunciation,
        audio,
        soundsLike,
        spelledLike,
        frequency,
        partOfSpeech,
        score,
        favourite,
      ];
}
