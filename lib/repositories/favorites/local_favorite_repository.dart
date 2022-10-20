import 'package:flut_nasa_image_lib/database/favorite_db.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/i_favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localFavoriteRepositoryProvider = Provider<LocalFavoriteRepository>((ref) {
  return LocalFavoriteRepository();
});

class LocalFavoriteRepository implements IFavoriteRepository {
  @override
  Future<Image> getFavorite({required String imageId}) async {
    return await FavoriteDB.getFavorite(imageId: imageId);
  }

  @override
  Future<List<Image>> getFavorites() async {
    return await FavoriteDB.getFavorites();
  }

  @override
  Future<void> addFavorite({required String imageId}) async {
    return await FavoriteDB.insertFavorite(imageId: imageId);
  }
  
  @override
  Future<void> removeFavorite({required String imageId}) async {
    return await FavoriteDB.deleteFavorite(imageId: imageId);
  }
  
  @override
  Future<void> removeAllFavorites() async {
    return await FavoriteDB.deleteAllFavorites();
  }
}