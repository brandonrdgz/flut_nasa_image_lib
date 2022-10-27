import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image_gallery.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/repository.dart';
import 'package:flut_nasa_image_lib/app/utils/images/image_resource.dart';

class ImageService {
  final HttpImageRepository httpImageRepository;
  final LocalImageRepository localImageRepository;

  ImageService ({
    required this.httpImageRepository,
    required this.localImageRepository,
  });

  Future<Image> getImage({required String id}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      Image image = await httpImageRepository.getImage(id: id);
      await localImageRepository.insertImage(image: image);
    }

    return await localImageRepository.getImage(id: id); 
  }

  Future<List<Image>> getImages() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    List<Image> images = await localImageRepository.getImages();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      if(images.isEmpty) {
        images = await httpImageRepository.getImages();
      }

      List<String> imagesUrlsToDownload = [];

      for(Image image in images) {
        if(await ImageResource.localImageDoesNotExist(image.imageUrl)) {
          imagesUrlsToDownload.add(image.imageUrl);
        }

        for(ImageGallery imageGallery in image.imageGallery) {
          if(await ImageResource.localImageDoesNotExist(imageGallery.imageUrl)) {
            imagesUrlsToDownload.add(imageGallery.imageUrl);
          }
        }
      }

      await localImageRepository.insertImages(images: images);

      await ImageResource.saveImages(imagesUrlsToDownload);
    }

    return Future.value(images);
  }
}