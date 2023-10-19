import 'package:dio/dio.dart';
import '../../../../domain/entities/joke.dart';

abstract class JokeState {
  List<JokeEntity>? jokeList;
  final DioError? error;

  JokeState({this.jokeList, this.error});
}

class JokeStateLoading extends JokeState {
  JokeStateLoading();
}

class JokeStateDone extends JokeState {
  JokeStateDone(List<JokeEntity> article) : super(jokeList: article);
}

class JokeStateError extends JokeState {
  JokeStateError(DioError error) : super(error: error);
}
