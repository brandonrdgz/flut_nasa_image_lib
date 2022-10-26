import 'package:dio/dio.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'http_image_repository.g.dart';

final httpImageRepositoryProvider = Provider<HttpImageRepository>((ref) {
  return HttpImageRepository(
    Dio()
  );
});

@RestApi(baseUrl: 'https://nasa-image-library.onrender.com/api/')
abstract class HttpImageRepository {
  factory HttpImageRepository(Dio dio, {String baseUrl}) = _HttpImageRepository;

  @GET('/images')
  Future<List<Image>> getImages();

  @GET('/images/{id}')
  Future<Image> getImage({@Path('id') required String id});
}