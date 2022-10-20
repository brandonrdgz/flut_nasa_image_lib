import 'package:flut_nasa_image_lib/models/image.dart';
import 'package:flut_nasa_image_lib/repositories/images/i_image_repository.dart';
import 'package:flut_nasa_image_lib/repositories/images/image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagesPageControllerProvider = StateNotifierProvider
  .autoDispose<ImagesPageController, AsyncValue<List<Image>>>(
    (ref) {
      return ImagesPageController(
        imageRepository: ref.watch(imageRepositoryProvider),
      );
    }
  );

class ImagesPageController extends StateNotifier<AsyncValue<List<Image>>> {
  final IImageRepository imageRepository;

  ImagesPageController({
    required this.imageRepository,
  }) : super(const AsyncValue.loading()) {
    getImages();
  }

  Future<void> getImages() async {
    try {
      state = const AsyncValue.loading();
      final List<Image> images = await imageRepository.getImages();
      state = AsyncValue.data(images);
    }
    catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}