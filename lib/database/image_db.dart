import 'package:flut_nasa_image_lib/database/database_provider.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/util/list_util.dart';
import 'package:sqflite/sqflite.dart';

class ImageDB {
  static final _databaseProvider = DatabaseProvider.databaseProvider;

  static Future<void> insertImage({
    required Image image,
  }) async {
    Database database = await _databaseProvider.database;

    if((await getImage(id: image.id)).id.isNotEmpty) {
      return;
    }

    Map<String, Object> imageMap = image.toMap();
    List<Map<String, Object>> imageGallery = ((imageMap.remove('imageGallery') ?? {}) as List).cast<Map<String, Object>>();
    await database.insert('image', imageMap);
    await _insertImageGallery(
      database: database,
      imageGalleryMap: imageGallery,
    );
  }

  static Future<void> _insertImageGallery({
    required Database database,
    required List<Map<String, Object>> imageGalleryMap,
  }) async {
    for(Map<String, Object> image in imageGalleryMap) {
      await database.insert('image_gallery', image);
    }
  }
  
  static Future<Image> getImage({
    required String id,
  }) async {
    Database database = await _databaseProvider.database;
    List<Map> resultSet = await database.query(
        'image',
        where: 'id = ?',
        whereArgs: [id],
      );
    List<Map<String, Object>> imageMapList = resultSet.castMapList<String, Object>();

    if(imageMapList.isEmpty) {
      return Image();  
    }

    imageMapList[0].addAll({
      'imageGallery': await _getImageGallery(database: database, id: id),
    });

    return Image.fromMap(map: imageMapList[0]);
  }

  static Future<List<Image>> getImages() async {
    Database database = await _databaseProvider.database;
    List<Map> resultSet = await database.query('image');
    List<Map<String, Object>> imagesMap =  resultSet.castMapList<String, Object>();

    List<Image> images = [];

    for(Map<String, Object> imageMap in imagesMap) {
      imageMap.addAll({
        'imageGallery': await _getImageGallery(
          database: database,
          id: (imageMap['id'] ?? '') as String
        )
      });

      images.add(Image.fromMap(map: imageMap));
    }

    return images;
  }

  static Future<List<Map<String, Object>>> _getImageGallery({
    required Database database,
    required String id,
  }) async {
    List<Map> resultSet = await database.query(
        'image_gallery',
        where: 'master_image_id = ?',
        whereArgs: [id],
      );
    
    return resultSet.castMapList<String, Object>();
  }
}