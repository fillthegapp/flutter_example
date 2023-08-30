import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

const Map<String, dynamic> _defaultQueryParameters = {'key': '0fiuZFh4'};

class MuseumNetworkClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.rijksmuseum.nl/api/en/',
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  )..interceptors
        .add(CertificatePinningInterceptor(allowedSHAFingerprints: <String>[
      "6A:E1:23:31:8D:9D:D4:EF:11:A1:C9:5C:37:6B:83:F8:70:9F:69:04:C9:7C:66:37:41:4E:22:15:55:A1:BD:BA"
    ]));

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
