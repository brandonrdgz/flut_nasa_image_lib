import 'package:flut_nasa_image_lib/app/core/module/images/image_gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class Image with _$Image {
  @JsonSerializable(explicitToJson: true)
  const factory Image({
    required String id,
    required String title,
    required String location,
    required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'image_gallery') required List<ImageGallery> imageGallery,
  }) = _Image;

  factory Image.empty() => const Image(id: '', description: '', imageGallery: [], imageUrl: '', location: '', title: '');

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

}