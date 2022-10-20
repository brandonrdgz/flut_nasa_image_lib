import 'package:flutter/foundation.dart';

class BaseApi {
  static const String _apiBaseUrl = "images-api.nasa.gov";

  @protected Uri buildUri({
    required String endpoint,
    Map<String, Object> queryParameters = const {},
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: endpoint,
      queryParameters: queryParameters,
    );
  }
}