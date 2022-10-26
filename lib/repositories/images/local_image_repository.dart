import 'package:flut_nasa_image_lib/database/image_db.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/images/i_image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localImageRepositoryProvider = Provider<LocalImageRepository>((ref) {
  return LocalImageRepository();
});

class LocalImageRepository implements IImageRepository {

  Future<void> insertImage({
    required Image image,
  }) async {
    await ImageDB.insertImage(image: image);
  }

  Future<void> insertImages({
    required List<Image> images,
  }) async {
    await ImageDB.insertImages(images: images);
  }
  
  @override
  Future<Image> getImage({required String id}) async {
    return await ImageDB.getImage(id: id);
  }

  @override
  Future<List<Image>> getImages() async {
    return await ImageDB.getImages();
  }
}