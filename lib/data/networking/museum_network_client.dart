import 'package:dio/dio.dart';

const Map<String, dynamic> _defaultQueryParameters = {'key': '0fiuZFh4'};

class MuseumNetworkClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.rijksmuseum.nl/api/en/',
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      path,
      queryParameters: Map.from(_defaultQueryParameters)
        ..addAll(queryParameters ?? {}),
    );
  }
}
