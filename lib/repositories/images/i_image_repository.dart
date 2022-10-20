import 'package:flut_nasa_image_lib/models/image.dart';

abstract class IImageRepository {
  Future<List<Image>> getImages();
  Future<Image> getImage({
    required String id,
  });
}