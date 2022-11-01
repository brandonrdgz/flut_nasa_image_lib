import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/app/utils/images/image_resource.dart';
import 'package:flutter/material.dart';

class ImageWidgetHelper {
  static Future<Widget> getImageWidget({
    required String imageUrl,
  }) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      if(await ImageResource.localImageExist(imageUrl)) {
        return _offlineImage(imageUrl);
      }
      else {
        return _onlineImage(imageUrl);
      }
    }

    return _offlineImage(imageUrl);
  }

  static Widget _onlineImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
    );
  }

  static Future<Widget> _offlineImage(String imageUrl) async {
    return Image.file(
      File(await ImageResource.getImagePath(imageUrl)),
      fit: BoxFit.contain,
    );
  }
}