import 'package:equatable/equatable.dart';

/// Contains multiple [type], [definition], [example] and [synonyms] for [Word] class.
class PartOfSpeech extends Equatable {
  final String type;
  final String definition;
  final String example;
  final List<String> synonyms;

  PartOfSpeech({this.type, this.definition, this.example, this.synonyms});

  factory PartOfSpeech.fromJson(Map<String, dynamic> json) {
    return PartOfSpeech(
      type: json['type'],
      definition: json['definition'],
      example: json['example'],
      synonyms: json['synonyms'] as List,
    );
  }

  @override
  List<Object> get props => [type, definition, example, synonyms];
}
