import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/app/core/module/favorites/repository.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';

class FavoriteService {
  final LocalFavoriteRepository localFavoriteRepository;

  FavoriteService ({
    required this.localFavoriteRepository,
  });

  Future<Image> getFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.getFavorite(imageId: imageId);
  }

  Future<List<Image>> getFavorites() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.getFavorites();
  }

  Future<void> addFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.addFavorite(imageId: imageId);
  }
  
  Future<void> removeFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.removeFavorite(imageId: imageId);
  }
  
  Future<void> removeAllFavorites() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.removeAllFavorites();
  }

}