import 'package:flut_nasa_image_lib/models/image_gallery.dart';

class Image{
  final String id;
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final List<ImageGallery> imageGallery;

  Image({
    this.id = '',
    this.title = '',
    this.location = '',
    this.description = '',
    this.imageUrl = '',
    this.imageGallery = const [],
  });

  factory Image.fromMap({
    required Map<String, Object> map,
  }){
    return Image(
      id: map['id'] as String,
      title: map['title'] as String,
      location: (map['location'] ?? 'Unknown') as String,
      description: map['description'] as String,
      imageUrl: map['image_url'] as String,
      imageGallery: (map['imageGallery'] as List<Map<String, Object>>)
        .map((imageMap) => ImageGallery.fromMap(map: imageMap)).toList(),
    );
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'description': description,
      'image_url': imageUrl,
      'imageGallery': imageGallery.map((image) => image.toMap()).toList(),
    };
  }
}