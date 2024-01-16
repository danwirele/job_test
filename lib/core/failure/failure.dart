import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [stackTrace];

  const Failure({
    required this.message,
    required this.stackTrace,
  });
}
