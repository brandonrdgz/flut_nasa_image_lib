import 'package:flut_nasa_image_lib/app/core/database/database_provider.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/utils/collections/list_util.dart';
import 'package:sqflite/sqflite.dart';

class ImageDB {
  static final _databaseProvider = DatabaseProvider.databaseProvider;

  static Future<void> insertImage({
    required Image image,
  }) async {
    Database database = await _databaseProvider.database;
    Batch batch = database.batch();

    if((await getImage(id: image.id)).id.isNotEmpty) {
      return;
    }

    Map<String, dynamic> imageMap = image.toJson();
    List<Map<String, dynamic>> imageGalleryMap = imageMap.remove('image_gallery') as List<Map<String, dynamic>>;

    batch.insert('image', imageMap);
    _insertImageGallery(batch: batch, imageGalleryMap: imageGalleryMap);

    await batch.commit();
  }

  static Future<void> insertImages({
    required List<Image> images,
  }) async {
    Database database = await _databaseProvider.database;
    Batch batch = database.batch();

    for(Image image in images) {
      if((await getImage(id: image.id)).id.isNotEmpty) {
        continue;
      }

      Map<String, dynamic> imageMap = image.toJson();
      List<Map<String, dynamic>> imageGalleryMap = imageMap.remove('image_gallery') as List<Map<String, dynamic>>;

      batch.insert('image', imageMap);
      _insertImageGallery(batch: batch, imageGalleryMap: imageGalleryMap);
    }

    await batch.commit(noResult: true);
  }

  static Future<void> _insertImageGallery({
    required Batch batch,
    required List<Map<String, dynamic>> imageGalleryMap,
  }) async {
    for(Map<String, dynamic> imageMap in imageGalleryMap) {
      batch.insert('image_gallery', imageMap);
    }
  }
  
  static Future<Image> getImage({
    required String id,
  }) async {
    Database database = await _databaseProvider.database;
    List<Map<String, Object?>> resultSet = await database.query(
        'image',
        where: 'id = ?',
        whereArgs: [id],
      );
    List<Map<String, Object>> imageMapList = resultSet.castMapList<String, Object>();

    if(imageMapList.isEmpty) {
      return Image.empty();  
    }

    imageMapList[0].addAll({
      'image_gallery': await _getImageGallery(database: database, id: id),
    });

    return Image.fromJson(imageMapList[0]);
  }

  static Future<List<Image>> getImages() async {
    Database database = await _databaseProvider.database;
    List<Map<String, Object?>> resultSet = await database.query('image');
    List<Map<String, Object>> imagesMap =  resultSet.castMapList<String, Object>();

    List<Image> images = [];

    for(Map<String, Object> imageMap in imagesMap) {
      imageMap.addAll({
        'image_gallery': await _getImageGallery(
          database: database,
          id: (imageMap['id'] ?? '') as String
        )
      });

      images.add(Image.fromJson(imageMap));
    }

    return images;
  }

  static Future<List<Map<String, Object>>> _getImageGallery({
    required Database database,
    required String id,
  }) async {
    List<Map<String, Object?>> resultSet = await database.query(
        'image_gallery',
        where: 'master_image_id = ?',
        whereArgs: [id],
      );
    
    return resultSet.castMapList<String, Object>();
  }
}