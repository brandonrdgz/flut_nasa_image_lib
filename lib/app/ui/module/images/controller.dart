import 'package:flut_nasa_image_lib/app/core/module/favorites/service.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/core/module/images/service.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_outlined_button.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_red_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesScreenController extends StateNotifier<AsyncValue<List<model.Image>>> {
  final ImageService imageService;

  ImagesScreenController({
    required this.imageService,
  }) : super(const AsyncValue.loading()) {
    getImages();
  }

  Future<void> getImages() async {
    try {
      state = const AsyncValue.loading();
      final List<model.Image> images = await imageService.getImages();
      state = AsyncValue.data(images);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}


class FavoriteButtonController extends StateNotifier<AsyncValue<Widget>> {
  final FavoriteService favoriteService;
  final String imageId;
  late bool _isFavorite;

  FavoriteButtonController({
    required this.favoriteService,
    required this.imageId,
  }) : super(const AsyncValue.loading()) {
    getFavorite(imageId: imageId);
  }

  Future<void> getFavorite({
    required String imageId,
  }) async {
    try {
      state = const AsyncValue.loading();
      final model.Image favorite = await favoriteService.getFavorite(imageId: imageId);
      _isFavorite = favorite.id.isNotEmpty;
      state = AsyncValue.data(
        _isFavorite ?
        FavoriteRedFilledButton(onTap: () => removeFavorite()):
        FavoriteOutlinedButton(onTap: () => addFavorite())
      );
    }
    catch(error, stackTrace) {
      _isFavorite = false;
      state = AsyncValue.data(FavoriteOutlinedButton(onTap: () => addFavorite()));
    }
  }

  Future<void> addFavorite() async {
    try {
      state = const AsyncValue.loading();
      await favoriteService.addFavorite(imageId: imageId);
      _isFavorite = true;
      state = AsyncValue.data(FavoriteRedFilledButton(onTap: () => removeFavorite()));
    }
    catch(error, stackTrace) {
      state = AsyncValue.data(FavoriteOutlinedButton(onTap: () => addFavorite()));
    }
  }

  Future<void> removeFavorite() async {
    try {
      state = const AsyncValue.loading();
      await favoriteService.removeFavorite(imageId: imageId);
      _isFavorite = false;
      state = AsyncValue.data(FavoriteOutlinedButton(onTap: () => addFavorite()));
    }
    catch(error, stackTrace) {
      state = AsyncValue.data(FavoriteRedFilledButton(onTap: () => removeFavorite()));
    }
  }
}