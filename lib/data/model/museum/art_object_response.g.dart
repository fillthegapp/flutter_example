// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjectResponse _$ArtObjectResponseFromJson(Map<String, dynamic> json) =>
    ArtObjectResponse(
      ArtObjectLinkResponse.fromJson(json['links'] as Map<String, dynamic>),
      json['id'] as String,
      json['title'] as String,
      ArtObjectWebImageResponse.fromJson(
          json['webImage'] as Map<String, dynamic>),
      json['principalOrFirstMaker'] as String,
    );

Map<String, dynamic> _$ArtObjectResponseToJson(ArtObjectResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'id': instance.id,
      'title': instance.title,
      'principalOrFirstMaker': instance.principalOrFirstMaker,
      'webImage': instance.webImage,
    };
