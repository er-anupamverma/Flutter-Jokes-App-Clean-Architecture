// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _JokesApiService implements JokesApiService {
  _JokesApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://geek-jokes.sameerkumar.website';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<Joke>> getNewsArticles({format}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'format': format,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<Joke>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    Joke value = Joke.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
