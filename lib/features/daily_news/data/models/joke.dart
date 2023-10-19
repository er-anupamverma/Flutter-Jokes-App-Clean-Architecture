import 'package:jokes_app_clean_architecture/features/daily_news/domain/entities/joke.dart';

class Joke extends JokeEntity {
  final String? joke;

  factory Joke.fromJson(Map<String, dynamic> map) {
    return new Joke(
      joke: map['joke'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'joke': this.joke,
    } as Map<String, dynamic>;
  }

  factory Joke.fromEntity(JokeEntity entity) {
    return Joke(
      joke: entity.joke,
    );
  }

  Joke({this.joke});
}
