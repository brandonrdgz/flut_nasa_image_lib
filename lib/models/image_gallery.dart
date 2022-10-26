import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_gallery.freezed.dart';
part 'image_gallery.g.dart';

@freezed
class ImageGallery with _$ImageGallery {
  const factory ImageGallery({
    @JsonKey(name: 'master_image_id') required String masterImageId,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _ImageGallery;

  factory ImageGallery.fromJson(Map<String, dynamic> json) => _$ImageGalleryFromJson(json);
}