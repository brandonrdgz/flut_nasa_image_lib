import 'package:flut_nasa_image_lib/api/image_api.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/base_http_repository.dart';
import 'package:flut_nasa_image_lib/repositories/images/i_image_repository.dart';
import 'package:flut_nasa_image_lib/util/http_util.dart';
import 'package:flut_nasa_image_lib/util/list_util.dart';
import 'package:flut_nasa_image_lib/util/map_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final httpImageRepositoryProvider = Provider<HttpImageRepository>((ref) {
  return HttpImageRepository(
    imageApi: ImageApi(),
    client: http.Client(),
  );
});

class HttpImageRepository extends BaseHttpRepository implements IImageRepository {
  final ImageApi imageApi;

  HttpImageRepository({
    required this.imageApi,
    required super.client
  });

  @override
  Future<Image> getImage({
    required String id,
  }) async {
    return getData<Image>(
      httpMethod: HttpMethod.get,
      uri: imageApi.image(id: id),
      builder: (data) async {
        List<Map<String, Object>> jsonImage = (data
          .getValue<String, Object, List>('items') ?? [])
          .castList<Map>().castMapList<String, Object>();

        return await _getImageHelper(imageMap: jsonImage.isNotEmpty ? jsonImage[0] : {});
      }
    );
  }

  Future<Image> _getImageHelper({required Map<String, Object> imageMap}) async {
    List<Map<String, Object>> jsonImageData = ((imageMap['data'] ?? []) as List)
      .castList<Map>().castMapList<String, Object>();

    if(jsonImageData.isEmpty) {
      return Image();
    }

    jsonImageData[0].addAll({'id': (jsonImageData[0].remove('nasa_id') ?? '') as String});
    jsonImageData[0].addAll({
      'imageGallery': await _getImageGallery(id: (jsonImageData[0]['id'] ?? '') as String),
      'image_url': imageMap.getValueFromDotPath<Object, String>('links.href') ?? [],
    });

    return Image.fromMap(map: jsonImageData[0]);
  }

  @override
  Future<List<Image>> getImages() {
    return getData<List<Image>>(
      httpMethod: HttpMethod.get,
      uri: imageApi.images(),
      builder: (data) async {
        List<Map<String, Object>> jsonImagesList = (data
          .getValue<String, Object, List>('items') ?? [])
          .castList<Map>().castMapList<String, Object>();

        List<Image> images = [];

        for(Map<String, Object> imageMap in jsonImagesList) {
          Image image = await _getImageHelper(
            imageMap: imageMap,
          );

          if(image.id.isNotEmpty) {
            images.add(image);
          }
        }

        return images;
      }
    );
  }
  
  Future<List<Map<String, Object>>> _getImageGallery({required String id}) {
    return getData<List<Map<String, Object>>>(
      httpMethod: HttpMethod.get,
      uri: imageApi.imageGallery(id: id),
      builder: (data) {
        List<Map<String, Object>> jsonImagesGallery = (data
          .getValue<String, Object, List>('items') ?? [])
          .castList<Map>().castMapList<String, Object>();

        List<Map<String, Object>> imageGallery = [];

        for(Map<String, Object> imageMap in jsonImagesGallery) {
          String imageUrl = (imageMap['href'] ?? '') as String;

          if(imageUrl.contains(RegExp(r'(\.jpg)|(\.png)'))) {
            imageGallery.add({
              'master_image_id': id,
              'image_url': imageUrl,
              'local_image_id': '',
            });
          }
        }

        return Future.value(imageGallery);
      }
    );
  }
}