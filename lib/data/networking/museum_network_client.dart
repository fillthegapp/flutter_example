import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

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
    ByteData certificate =
        await rootBundle.load('certificates/rijksmuseum.pem');

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      SecurityContext sc = SecurityContext();
      sc.setTrustedCertificatesBytes(certificate.buffer.asUint8List());
      HttpClient httpClient = HttpClient(context: sc);
      return httpClient;
    };

    return await _dio.get(
      path,
      queryParameters: Map.from(_defaultQueryParameters)
        ..addAll(queryParameters ?? {}),
    );
  }
}
