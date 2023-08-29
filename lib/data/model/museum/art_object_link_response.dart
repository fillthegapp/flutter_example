import 'package:json_annotation/json_annotation.dart';

part 'art_object_link_response.g.dart';

@JsonSerializable()
class ArtObjectLinkResponse {
  @JsonKey(name: 'web')
  final String web;

  factory ArtObjectLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectLinkResponseFromJson(json);

  ArtObjectLinkResponse(this.web);
}
