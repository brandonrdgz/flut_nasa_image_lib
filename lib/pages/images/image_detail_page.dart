import 'package:flut_nasa_image_lib/controllers/favorites/favorites_page_controller.dart';
import 'package:flut_nasa_image_lib/controllers/images/image_detail_page_controller.dart';
import 'package:flut_nasa_image_lib/models/image.dart' as model;
import 'package:flut_nasa_image_lib/widgets/common_scaffold.dart';
import 'package:flut_nasa_image_lib/widgets/images/gallery/image_gallery_card.dart';
import 'package:flut_nasa_image_lib/widgets/images/image_description_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageDetailPage extends ConsumerWidget {
  final model.Image image;

  const ImageDetailPage({
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> favoriteAsyncValue = ref.watch(imageDetailPageControllerProvider(image.id));
    final AsyncValue<List<model.Image>> favoritesPageAsyncValue = ref.watch(favoritesPageControllerProvider);

    return CommonScaffold(
      buildDrawer: false,
      title: image.title,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageGalleryCard(
              imageGallery: image.imageGallery,
            ),
            ImageDescriptionCard(
              image: image,
              ref: ref,
              favoriteAsyncValue: favoriteAsyncValue,
            ),
          ],
        ),
      ),
    );
  }
}