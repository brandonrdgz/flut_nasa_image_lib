import 'dart:io';

import 'package:al_downloader/al_downloader.dart';

class ImageResource {
  static const String _imagesDirectory = 'images/';

  static String _trimSpecialCharsStringURL(String url) {
    return url.replaceAll(RegExp(r'(//)|/|:'), '');
  }

  static Future<void> saveImage(String imageUrl) async {
    String imagePath = await getImagePath(imageUrl);

    if(imagePath.isNotEmpty || await File(imagePath).exists()) {
      return ;
    }

    await ALDownloader.download(imageUrl);
  }

  static Future<void> saveImages(List<String> imagesUrls) async {
    await ALDownloaderBatcher.downloadUrls(imagesUrls);
  }

  static Future<String> getImagePath(String imageUrl) async {
    return await ALDownloaderPersistentFileManager.getAbsolutePhysicalPathOfFileForUrl(imageUrl) ?? '';
  }

  static Future<bool> localImageExist(String imageUrl) async {
    String imagePath = await getImagePath(imageUrl);

    return imagePath.isNotEmpty || await File(imagePath).exists();
  }

  static Future<bool> localImageDoesNotExist(String imageUrl) async {
    return ! await localImageExist(imageUrl);
  }
}