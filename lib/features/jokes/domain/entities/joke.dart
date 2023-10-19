import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  final String? joke;

  JokeEntity({this.joke});

  @override
  List<Object?> get props {
    return [joke];
  }
}
