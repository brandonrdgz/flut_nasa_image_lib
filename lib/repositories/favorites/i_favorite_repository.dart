import 'package:flut_nasa_image_lib/models/image.dart';

abstract class IFavoriteRepository {
  Future<void> addFavorite({
    required String imageId,
  });
  Future<Image> getFavorite({
    required String imageId,
  });
  Future<List<Image>> getFavorites();
  Future<void> removeFavorite({
    required String imageId,
  });
  Future<void> removeAllFavorites();
}