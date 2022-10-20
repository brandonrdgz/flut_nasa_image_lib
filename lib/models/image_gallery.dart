class ImageGallery {
  final String masterImageId;
  final String imageUrl;

  ImageGallery({
    required this.masterImageId,
    required this.imageUrl,
  });

  factory ImageGallery.fromMap({
    required Map<String, Object> map,
  }) {
    return ImageGallery(
      masterImageId: map['master_image_id'] as String,
      imageUrl: map['image_url'] as String,
    );
  }

  Map<String, Object> toMap() {
    return {
      'master_image_id': masterImageId,
      'image_url': imageUrl,
    };
  }
}