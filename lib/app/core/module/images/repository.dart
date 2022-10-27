import 'package:dio/dio.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image_db.dart';
import 'package:retrofit/retrofit.dart';

part 'repository.g.dart';

class LocalImageRepository {

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
  
  Future<Image> getImage({required String id}) async {
    return await ImageDB.getImage(id: id);
  }

  Future<List<Image>> getImages() async {
    return await ImageDB.getImages();
  }
}

@RestApi(baseUrl: 'https://nasa-image-library.onrender.com/api/')
abstract class HttpImageRepository {
  factory HttpImageRepository(Dio dio, {String baseUrl}) = _HttpImageRepository;

  @GET('/images')
  Future<List<Image>> getImages();

  @GET('/images/{id}')
  Future<Image> getImage({@Path('id') required String id});
}