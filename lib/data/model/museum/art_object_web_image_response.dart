import 'package:json_annotation/json_annotation.dart';

part 'art_object_web_image_response.g.dart';

@JsonSerializable()
class ArtObjectWebImageResponse {
  @JsonKey(name: 'url')
  final String url;

  factory ArtObjectWebImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectWebImageResponseFromJson(json);

  ArtObjectWebImageResponse(this.url);
}
