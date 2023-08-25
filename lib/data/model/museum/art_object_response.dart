import 'package:flutter_example/data/model/museum/art_object_link_response.dart';
import 'package:flutter_example/domain/model/art_object_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'art_object_web_image_response.dart';

part 'art_object_response.g.dart';

@JsonSerializable()
class ArtObjectResponse {
  @JsonKey(name: 'links')
  final ArtObjectLinkResponse links;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'principalOrFirstMaker')
  final String principalOrFirstMaker;

  @JsonKey(name: 'webImage')
  final ArtObjectWebImageResponse webImage;

  factory ArtObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectResponseFromJson(json);

  ArtObjectResponse(
    this.links,
    this.id,
    this.title,
    this.webImage,
    this.principalOrFirstMaker,
  );

  ArtObjectModel toDomain() {
    return ArtObjectModel(
      id: id,
      title: title,
      author: principalOrFirstMaker,
      image: webImage.url,
      link: links.web,
    );
  }
}
