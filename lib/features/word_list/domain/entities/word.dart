import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Word extends Equatable {
  final String title;
  final String id;
  final String description;
  final String example;
  final String url;
  final int score;
  final bool favourite;

  Word({
    @required this.title,
    @required this.id,
    @required this.description,
    @required this.example,
    @required this.url,
    @required this.score,
    @required this.favourite,
  });

  @override
  List<Object> get props => [title, id, description, example, url, score, favourite];
}
