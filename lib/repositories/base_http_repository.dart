import 'dart:convert';

import 'package:flut_nasa_image_lib/util/http_util.dart';
import 'package:flut_nasa_image_lib/util/map_util.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseHttpRepository {
  final http.Client client;

  @protected BaseHttpRepository({
    required this.client,
  });

  @protected Future<T> getData<T>({
    required HttpMethod httpMethod,
    required Uri uri,
    required Future<T> Function(Map<String, Object> data) builder,
  }) async {
    final http.Response response = await HttpUtil.makeRequest(
      client: client,
      httpMethod: httpMethod,
      uri: uri
    );
    final Map<String, Object> data = (json.decode(response.body) as Map).castMap<String, Object>();

    return builder(data);
  }
}