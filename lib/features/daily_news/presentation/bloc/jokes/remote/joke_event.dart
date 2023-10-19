import 'package:jokes_app_clean_architecture/features/daily_news/domain/entities/joke.dart';

abstract class JokeEvent {
  const JokeEvent();
}

class GetJokeEvent extends JokeEvent {
  List<JokeEntity>? jokeList;

  GetJokeEvent(this.jokeList);
}
