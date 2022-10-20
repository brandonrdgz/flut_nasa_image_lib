import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/i_favorite_repository.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/local_favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRepositoryProvider = Provider<IFavoriteRepository>((ref) {
  return FavoriteRepository(
    localFavoriteRepository: ref.watch(localFavoriteRepositoryProvider),
  );
});

class FavoriteRepository implements IFavoriteRepository {
  final LocalFavoriteRepository localFavoriteRepository;

  FavoriteRepository ({
    required this.localFavoriteRepository,
  });

  @override
  Future<Image> getFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.getFavorite(imageId: imageId);
  }

  @override
  Future<List<Image>> getFavorites() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.getFavorites();
  }

  @override
  Future<void> addFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.addFavorite(imageId: imageId);
  }
  
  @override
  Future<void> removeFavorite({required String imageId}) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.removeFavorite(imageId: imageId);
  }
  
  @override
  Future<void> removeAllFavorites() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {

    }

    return await localFavoriteRepository.removeAllFavorites();
  }

}