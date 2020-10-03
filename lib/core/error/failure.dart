import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const [];

  @override
  List<Object> get props => [properties];
}
