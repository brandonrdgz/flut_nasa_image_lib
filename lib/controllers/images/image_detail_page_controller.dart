import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/favorite_repository.dart';
import 'package:flut_nasa_image_lib/repositories/favorites/i_favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageDetailPageControllerProvider = StateNotifierProvider
  .autoDispose.family<ImageDetailPageController, AsyncValue<bool>, String>(
    (ref, imageId) {
      return ImageDetailPageController(
        favoriteRepository: ref.watch(favoriteRepositoryProvider),
        imageId: imageId,
      );
    }
);

class ImageDetailPageController extends StateNotifier<AsyncValue<bool>> {
  final IFavoriteRepository favoriteRepository;
  final String imageId;
  late bool _isFavorite;

  ImageDetailPageController({
    required this.favoriteRepository,
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
      final Image favorite = await favoriteRepository.getFavorite(imageId: imageId);
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
      await favoriteRepository.addFavorite(imageId: imageId);
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
      await favoriteRepository.removeFavorite(imageId: imageId);
      _isFavorite = false;
      state = AsyncValue.data(_isFavorite);
    }
    catch(error, stackTrace) {
      state = AsyncValue.data(_isFavorite);
    }
  }
}