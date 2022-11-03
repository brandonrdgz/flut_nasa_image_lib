import 'dart:async';

import 'package:flut_nasa_image_lib/app/core/module/favorites/service.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreenController extends StateNotifier<AsyncValue<List<Image>>> {
  final FavoriteService favoriteService;

  FavoritesScreenController ({
    required this.favoriteService,
  }) : super(const AsyncValue.loading()) {
    getFavorites();
  }

  Future<void> getFavorites() async {
    try {
    state = const AsyncValue.loading();

    favoriteService.getFavorites().listen(
      (futureImagesList) async {
        state = AsyncValue.data(await Future.wait<Image>(futureImagesList, eagerError: true));
      },
      onError: (Object error, StackTrace stackTrace) {
        state = const AsyncValue.data(<Image>[]);
      },
    );
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeAllFavorites() async {
    try {
      state = const AsyncValue.loading();
      await favoriteService.removeAllFavorites();
      state = const AsyncValue.data(<Image>[]);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}