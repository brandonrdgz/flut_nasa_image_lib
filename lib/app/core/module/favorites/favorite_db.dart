import 'package:flut_nasa_image_lib/app/core/database/database_provider.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image_db.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/utils/collections/list_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlbrite/sqlbrite.dart';

class FavoriteDB {
  static final Future<Database> _dataBaseFuture = DatabaseProvider.databaseProvider.database;
  static final Future<BriteDatabase> _briteDBFuture = _dataBaseFuture.then((database) => BriteDatabase(database));

  static Future<void> insertFavorite({
    required String imageId,
  }) async {
    BriteDatabase briteDB = await _briteDBFuture;

    if((await getFavorite(imageId: imageId)).id.isNotEmpty) {
      return;
    }

    await briteDB.insert('favorites', {'image_id': imageId});

    //await database.insert('favorites', {'image_id': imageId});
  }

  static Future<Image> getFavorite({
    required String imageId,
  }) async {
    Database database = await _dataBaseFuture;

    List<Map<String, Object?>> resultSet = await database.query(
        'favorites',
        where: 'image_id = ?',
        whereArgs: [imageId]
      );
    List<Map<String, Object>> favorite = resultSet.castMapList<String, Object>();

    if(favorite.isEmpty || favorite[0].isEmpty) {
      return Image.empty();
    }
    else {
      return await ImageDB.getImage(id: imageId);
    }
  }

  static Stream<List<Future<Image>>> getFavorites() async* {
    BriteDatabase briteDatabase = await _briteDBFuture;

    yield* briteDatabase.createQuery('favorites').mapToList((favoriteMap) async {
      return await ImageDB.getImage(id: (favoriteMap['image_id'] ?? '') as String);
    });

    /* List<Map<String, Object?>> resultSet = await database.query('favorites');

    List<Map<String, Object>> favorites = resultSet.castMapList<String, Object>();

    List<Image> images = [];

    for(Map<String, Object> favoriteMap in favorites) {
      Image image = await ImageDB.getImage(id: (favoriteMap['image_id'] ?? '') as String);

      if(image.id.isNotEmpty) {
        images.add(image);
      }
    }

    return images; */
  }

  static Future<void> deleteFavorite({
    required String imageId,
  }) async {
    BriteDatabase briteDatabase = await _briteDBFuture;

    await briteDatabase.delete(
      'favorites',
      where: 'image_id = ?',
      whereArgs: [imageId],
    );

    /* await database.delete(
      'favorites',
      where: 'image_id = ?',
      whereArgs: [imageId],
    ); */
  }

  static Future<void> deleteAllFavorites() async {
    BriteDatabase briteDatabase = await _briteDBFuture;

    await briteDatabase.delete('favorites');

    //await database.delete('favorites');
  }
}