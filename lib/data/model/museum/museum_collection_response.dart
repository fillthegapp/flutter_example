import 'package:flutter_example/data/model/museum/art_object_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'museum_collection_response.g.dart';

@JsonSerializable()
class MuseumCollectionResponse {
  @JsonKey(name: 'artObjects')
  final List<ArtObjectResponse> artObjects;

  factory MuseumCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$MuseumCollectionResponseFromJson(json);

  MuseumCollectionResponse(this.artObjects);
}
