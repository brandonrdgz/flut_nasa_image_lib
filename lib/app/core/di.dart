import 'package:dio/dio.dart';
import 'package:flut_nasa_image_lib/app/core/module/favorites/repository.dart';
import 'package:flut_nasa_image_lib/app/core/module/favorites/service.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/repository.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/service.dart';
import 'package:flut_nasa_image_lib/app/ui/module/favorites/controller.dart';
import 'package:flut_nasa_image_lib/app/ui/module/images/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Images Providers

final imagesScreenControllerProvider = StateNotifierProvider
  .autoDispose<ImagesScreenController, AsyncValue<List<Image>>>(
    (ref) {
      return ImagesScreenController(
        imageService: ref.watch(imageServiceProvider),
      );
    }
  );

final imageDetailScreenControllerProvider = StateNotifierProvider
  .autoDispose.family<ImageDetailScreenController, AsyncValue<bool>, String>(
    (ref, imageId) {
      return ImageDetailScreenController(
        favoriteService: ref.watch(favoriteServiceProvider),
        imageId: imageId,
      );
    }
);

final imageServiceProvider = Provider<ImageService>((ref) {
  return ImageService(
    httpImageRepository: ref.watch(httpImageRepositoryProvider),
    localImageRepository: ref.watch(localImageRepositoryProvider),
  );
});

final localImageRepositoryProvider = Provider<LocalImageRepository>((ref) {
  return LocalImageRepository();
});

final httpImageRepositoryProvider = Provider<HttpImageRepository>((ref) {
  return HttpImageRepository(
    Dio()
  );
});


//Favorites providers

final favoritesScreenControllerProvider = StateNotifierProvider
  .autoDispose<FavoritesScreenController, AsyncValue<List<Image>>>(
    (ref) {
      return FavoritesScreenController(
        favoriteService: ref.watch(favoriteServiceProvider),
      );
    }
  );

final favoriteServiceProvider = Provider<FavoriteService>((ref) {
  return FavoriteService(
    localFavoriteRepository: ref.watch(localFavoriteRepositoryProvider),
  );
});

final localFavoriteRepositoryProvider = Provider<LocalFavoriteRepository>((ref) {
  return LocalFavoriteRepository();
});