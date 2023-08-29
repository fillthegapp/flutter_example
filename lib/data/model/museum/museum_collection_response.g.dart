// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'museum_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuseumCollectionResponse _$MuseumCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    MuseumCollectionResponse(
      (json['artObjects'] as List<dynamic>)
          .map((e) => ArtObjectResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MuseumCollectionResponseToJson(
        MuseumCollectionResponse instance) =>
    <String, dynamic>{
      'artObjects': instance.artObjects,
    };
