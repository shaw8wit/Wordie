import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Word extends Equatable {
  final String word;
  final String id;
  final String description;
  final String example;
  final String url;
  final int score;
  final bool favourite;

  Word({
    @required this.word,
    @required this.id,
    @required this.description,
    @required this.example,
    @required this.url,
    @required this.score,
    @required this.favourite,
  });

  @override
  List<Object> get props => [word, id, description, example, url, score, favourite];
}
