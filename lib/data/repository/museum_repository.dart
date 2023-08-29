import 'package:flutter_example/data/api/museum_api.dart';
import 'package:flutter_example/data/model/museum/museum_collection_response.dart';
import 'package:flutter_example/domain/model/art_object_model.dart';

class MuseumRepository {
  final MuseumApi _api;

  MuseumRepository(this._api);

  Future<List<ArtObjectModel>> getCollection() async {
    MuseumCollectionResponse response = await _api.getMuseumCollection();

    return response.artObjects.map((e) => e.toDomain()).toList();
  }
}
