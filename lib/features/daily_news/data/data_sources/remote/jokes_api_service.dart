import 'package:jokes_app_clean_architecture/features/daily_news/data/models/joke.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';

part 'jokes_api_service.g.dart';

@RestApi(baseUrl: APIBaseURL)
abstract class JokesApiService {
  factory JokesApiService(Dio dio) = _JokesApiService;

  @GET('/api')
  Future<HttpResponse<Joke>> getNewsArticles({
    @Query("format") String? format,
  });
}
