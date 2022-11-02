import 'package:flut_nasa_image_lib/app/core/module/favorites/favorite_db.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';

class LocalFavoriteRepository {
  Future<Image> getFavorite({required String imageId}) async {
    return await FavoriteDB.getFavorite(imageId: imageId);
  }

  Stream<List<Future<Image>>> getFavorites() {
    return FavoriteDB.getFavorites();
  }

  Future<void> addFavorite({required String imageId}) async {
    return await FavoriteDB.insertFavorite(imageId: imageId);
  }
  
  Future<void> removeFavorite({required String imageId}) async {
    return await FavoriteDB.deleteFavorite(imageId: imageId);
  }
  
  Future<void> removeAllFavorites() async {
    return await FavoriteDB.deleteAllFavorites();
  }
}