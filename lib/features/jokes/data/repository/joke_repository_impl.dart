import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jokes_app_clean_architecture/features/jokes/data/models/joke.dart';
import 'package:jokes_app_clean_architecture/core/resources/data_state.dart';
import 'package:jokes_app_clean_architecture/features/jokes/domain/repository/joke_repository.dart';

import '../data_sources/remote/jokes_api_service.dart';

class JokeRepositoryImpl implements JokeRepository {
  final JokesApiService _newsApiService;

  JokeRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<Joke>> getNewsArticles() async {
    try {
      final httpResponse =
          await _newsApiService.getNewsArticles(format: "json");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
