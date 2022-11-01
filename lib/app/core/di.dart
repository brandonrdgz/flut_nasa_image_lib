import 'package:dio/dio.dart';
import 'package:flut_nasa_image_lib/app/core/module/favorites/repository.dart';
import 'package:flut_nasa_image_lib/app/core/module/favorites/service.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/core/module/images/repository.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/service.dart';
import 'package:flut_nasa_image_lib/app/ui/module/favorites/controller.dart';
import 'package:flut_nasa_image_lib/app/ui/module/images/controller.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/images/image_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Future provider for getting the image widget to show (local or network)
final imageWidgetProvider = FutureProvider.family<Widget, String>(
  (ref, imageUrl) => ImageWidgetHelper.getImageWidget(imageUrl: imageUrl),
);

// Future provider for getting the image widgets to show (local or network)
final imageWidgetsProvider = FutureProvider.family<List<Widget>, List<String>>(
  (ref, imagesUrls) => Future.wait<Widget>(
    imagesUrls.map<Future<Widget>>((imageUrl) => ImageWidgetHelper.getImageWidget(imageUrl: imageUrl)),
    eagerError: true
  ),
);

// Images Providers

final imagesScreenControllerProvider = StateNotifierProvider
  .autoDispose<ImagesScreenController, AsyncValue<List<model.Image>>>(
    (ref) {
      return ImagesScreenController(
        imageService: ref.watch(imageServiceProvider),
      );
    }
  );

final favoriteButtonControllerProvider = StateNotifierProvider
  .autoDispose.family<FavoriteButtonController, AsyncValue<Widget>, String>(
    (ref, imageId) {
      return FavoriteButtonController(
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
  .autoDispose<FavoritesScreenController, AsyncValue<List<model.Image>>>(
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