import 'package:jokes_app_clean_architecture/core/resources/data_state.dart';
import 'package:jokes_app_clean_architecture/core/usecase/usecase.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/entities/joke.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/repository/joke_repository.dart';

class GetJokeUseCase implements UseCase<DataState<JokeEntity>, void> {
  final JokeRepository _articleRepository;

  GetJokeUseCase(this._articleRepository);

  @override
  Future<DataState<JokeEntity>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
