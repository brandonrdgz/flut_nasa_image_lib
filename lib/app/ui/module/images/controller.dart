import 'package:flut_nasa_image_lib/app/core/module/favorites/service.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesScreenController extends StateNotifier<AsyncValue<List<Image>>> {
  final ImageService imageService;

  ImagesScreenController({
    required this.imageService,
  }) : super(const AsyncValue.loading()) {
    getImages();
  }

  Future<void> getImages() async {
    try {
      state = const AsyncValue.loading();
      final List<Image> images = await imageService.getImages();
      state = AsyncValue.data(images);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}


class ImageDetailScreenController extends StateNotifier<AsyncValue<bool>> {
  final FavoriteService favoriteService;
  final String imageId;
  late bool _isFavorite;

  ImageDetailScreenController({
    required this.favoriteService,
    required this.imageId,
  }) : super(const AsyncValue.loading()) {
    getFavorite(imageId: imageId);
  }

  bool get isFavorite => _isFavorite;

  Future<void> getFavorite({
    required String imageId,
  }) async {
    try {
      state = const AsyncValue.loading();
      final Image favorite = await favoriteService.getFavorite(imageId: imageId);
      _isFavorite = favorite.id.isNotEmpty;
      state = AsyncValue.data(_isFavorite);
    }
    catch(error, stackTrace) {
      _isFavorite = false;
      state = AsyncValue.data(_isFavorite);
    }
  }

  Future<void> addFavorite() async {
    try {
      state = const AsyncValue.loading();
      await favoriteService.addFavorite(imageId: imageId);
      _isFavorite = true;
      state = AsyncValue.data(_isFavorite);
    }
    catch(error, stackTrace) {
      state = AsyncValue.data(_isFavorite);
    }
  }

  Future<void> removeFavorite() async {
    try {
      state = const AsyncValue.loading();
      await favoriteService.removeFavorite(imageId: imageId);
      _isFavorite = false;
      state = AsyncValue.data(_isFavorite);
    }
    catch(error, stackTrace) {
      state = AsyncValue.data(_isFavorite);
    }
  }
}