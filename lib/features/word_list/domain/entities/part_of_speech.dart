import 'package:equatable/equatable.dart';

/// Contains multiple [type], [definition], [example] and [synonyms] for [Word] class.
class PartOfSpeech extends Equatable {
  final String type;
  final String definition;
  final String example;
  final List<String> synonyms;

  PartOfSpeech({this.type, this.definition, this.example, this.synonyms});

  @override
  List<Object> get props => [type, definition, example, synonyms];
}
