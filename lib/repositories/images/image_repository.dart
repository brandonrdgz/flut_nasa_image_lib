import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/models/image_gallery.dart';
import 'package:flut_nasa_image_lib/repositories/images/http_image_repository.dart';
import 'package:flut_nasa_image_lib/repositories/images/i_image_repository.dart';
import 'package:flut_nasa_image_lib/repositories/images/local_image_repository.dart';
import 'package:flut_nasa_image_lib/util/image_resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageRepositoryProvider = Provider<IImageRepository>((ref) {
  return ImageRepository(
    httpImageRepository: ref.watch(httpImageRepositoryProvider),
    localImageRepository: ref.watch(localImageRepositoryProvider),
  );
});

class ImageRepository implements IImageRepository {
  final HttpImageRepository httpImageRepository;
  final LocalImageRepository localImageRepository;

  ImageRepository ({
    required this.httpImageRepository,
    required this.localImageRepository,
  });

  @override
  Future<Image> getImage({required String id}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      Image image = await httpImageRepository.getImage(id: id);
      await localImageRepository.insertImage(image: image);
    }

    return await localImageRepository.getImage(id: id); 
  }

  @override
  Future<List<Image>> getImages() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      List<Image> images = await httpImageRepository.getImages();
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

        await localImageRepository.insertImage(image: image);
      }

      await ImageResource.saveImages(imagesUrlsToDownload);
    }

    return await localImageRepository.getImages();
  }
}