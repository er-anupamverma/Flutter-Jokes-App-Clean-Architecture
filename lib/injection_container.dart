import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:jokes_app_clean_architecture/features/jokes/data/data_sources/remote/jokes_api_service.dart';
import 'package:jokes_app_clean_architecture/features/jokes/data/repository/joke_repository_impl.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/repository/joke_repository.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/usecases/get_joke.dart';
import 'package:jokes_app_clean_architecture/features/jokes/presentation/bloc/jokes/remote/joke_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<JokesApiService>(JokesApiService(sl()));
  sl.registerSingleton<JokeRepository>(JokeRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetJokeUseCase>(GetJokeUseCase(sl()));

  //Blocs
  sl.registerFactory<JokeBloc>(() => JokeBloc(sl()));
}
