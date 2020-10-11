import 'package:equatable/equatable.dart';

class PartOfSpeech extends Equatable {
  final String type;
  final String definition;
  final String example;
  final List<String> synonyms;

  PartOfSpeech({this.type, this.definition, this.example, this.synonyms});

  @override
  List<Object> get props => [type, definition, example, synonyms];
}
