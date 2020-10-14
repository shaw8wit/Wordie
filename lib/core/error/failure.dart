import 'package:equatable/equatable.dart';

/// Represents the failing condition.
abstract class Failure extends Equatable {
  final List properties = const [];

  @override
  List<Object> get props => [properties];
}
