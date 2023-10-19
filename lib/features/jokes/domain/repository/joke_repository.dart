import 'package:jokes_app_clean_architecture/core/resources/data_state.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/entities/joke.dart';

abstract class JokeRepository {
  // API methods
  Future<DataState<JokeEntity>> getNewsArticles();
}
