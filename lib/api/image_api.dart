import 'package:flut_nasa_image_lib/api/base_api.dart';

class ImageApi extends BaseApi {
  Uri images() {
    return buildUri(
      endpoint: "/search",
      queryParameters: {
        "q": "''",
      }
    );
  }

  Uri image({
    required String id,
  }) {
    return buildUri(
      endpoint: "",
      queryParameters: {
        "nasa_id": id,
      },
    );
  }

  Uri imageGallery({
    required String id,
  }) {
    return buildUri(
      endpoint: "/asset/$id",
    );
  }

}