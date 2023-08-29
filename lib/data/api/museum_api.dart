import 'package:dio/dio.dart';
import 'package:flutter_example/data/model/museum/museum_collection_response.dart';
import 'package:flutter_example/data/networking/museum_network_client.dart';

class MuseumApi {
  final MuseumNetworkClient _client;

  MuseumApi(this._client);

  Future<MuseumCollectionResponse> getMuseumCollection() async {
    Response response = await _client.get('collection');

    return MuseumCollectionResponse.fromJson(response.data);
  }
}
