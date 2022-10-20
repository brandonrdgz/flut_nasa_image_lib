import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/util/image_resource.dart';
import 'package:flutter/material.dart';

class ImageWidgetHelper {
  static Future<Widget> getImageWidget({
    required String imageUrl,
  }) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      if(await ImageResource.localImageExist(imageUrl)) {
        return offlineImage(imageUrl);
      }
      else {
        return onlineImage(imageUrl);
      }
    }

    return offlineImage(imageUrl);
  }

  static Widget onlineImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
    );
  }

  static Future<Widget> offlineImage(String imageUrl) async {
    return Image.file(
      File(await ImageResource.getImagePath(imageUrl)),
      fit: BoxFit.contain,
    );
  }
}