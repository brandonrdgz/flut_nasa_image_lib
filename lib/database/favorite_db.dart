import 'package:flut_nasa_image_lib/database/database_provider.dart';
import 'package:flut_nasa_image_lib/database/image_db.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/util/list_util.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDB {
  static final _databaseProvider = DatabaseProvider.databaseProvider;

  static Future<void> insertFavorite({
    required String imageId,
  }) async {
    Database database = await _databaseProvider.database;

    if((await getFavorite(imageId: imageId)).id.isNotEmpty) {
      return;
    }

    await database.insert('favorites', {'image_id': imageId});
  }

  static Future<Image> getFavorite({
    required String imageId,
  }) async {
    Database database = await _databaseProvider.database;

    List<Map> resultSet = await database.query(
        'favorites',
        where: 'image_id = ?',
        whereArgs: [imageId]
      );
    List<Map<String, Object>> favorite = resultSet.castMapList<String, Object>();

    if(favorite.isEmpty || favorite[0].isEmpty) {
      return Image();
    }
    else {
      return await ImageDB.getImage(id: imageId);
    }
  }

  static Future<List<Image>> getFavorites() async {
    Database database = await _databaseProvider.database;

    List<Map> resultSet = await database.query('favorites');
    List<Map<String, Object>> favorites = resultSet.castMapList<String, Object>();

    List<Image> images = [];

    for(Map<String, Object> favoriteMap in favorites) {
      Image image = await ImageDB.getImage(id: (favoriteMap['image_id'] ?? '') as String);

      if(image.id.isNotEmpty) {
        images.add(image);
      }
    }

    return images;
  }

  static Future<void> deleteFavorite({
    required String imageId,
  }) async {
    Database database = await _databaseProvider.database;

    await database.delete(
      'favorites',
      where: 'image_id = ?',
      whereArgs: [imageId],
    );
  }

  static Future<void> deleteAllFavorites() async {
    Database database = await _databaseProvider.database;

    await database.delete('favorites');
  }
}