import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/favorite_repository.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/i_favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesPageControllerProvider = StateNotifierProvider
  .autoDispose<FavoritesPageController, AsyncValue<List<Image>>>(
    (ref) {
      return FavoritesPageController(
        favoriteRepository: ref.watch(favoriteRepositoryProvider),
      );
    }
  );

class FavoritesPageController extends StateNotifier<AsyncValue<List<Image>>> {
  final IFavoriteRepository favoriteRepository;

  FavoritesPageController ({
    required this.favoriteRepository,
  }) : super(const AsyncValue.loading()) {
    getFavorites();
  }

  Future<void> getFavorites() async {
    try {
      state = const AsyncValue.loading();
      final List<Image> favorites = await favoriteRepository.getFavorites();
      state = AsyncValue.data(favorites);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeAllFavorites() async {
    try {
      state = const AsyncValue.loading();
      await favoriteRepository.removeAllFavorites();
      state = const AsyncValue.data([]);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}