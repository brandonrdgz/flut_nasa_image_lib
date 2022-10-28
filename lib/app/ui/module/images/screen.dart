import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/widget/app/app_scaffold.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/common/empty.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/gallery/image_gallery_card.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/image_card.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/image_description_card.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/snackbar/errors.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagesScreen extends ConsumerWidget {
  const ImagesScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<model.Image>> imagesAsyncValue = ref.watch(imagesScreenControllerProvider);

    ref.listen(
      imagesScreenControllerProvider,
      (_, nextState) => nextState.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            Errors.getErrorSnackbar(
              context: context,
              error: error,
              onActionPressed: () => ref.read(imagesScreenControllerProvider.notifier).getImages()
            )
          );
        },
      ),
    );

    return AppScaffold(
      buildDrawer: true,
      title: S.of(context).appTitle,
      body: imagesAsyncValue.when(
        data: (imagesListData) {
          if(imagesListData.isNotEmpty) {
            return ListView.builder(
              itemCount: imagesListData.length,
              itemBuilder: (_, index) {
                return ImageCard(
                  image: imagesListData[index]
                );
              },
            );
          }
          else {
            return Empty(message: S.of(context).emptyImagesList);
          }
        },
        error: (error, stackTrace) {
          return Empty(message: S.of(context).emptyImagesList);
        },
        loading: () => const Center(child: CircularProgressIndicator(),),
      ),
    );
  }

}

class ImageDetailScreen extends ConsumerWidget {
  final model.Image image;

  const ImageDetailScreen({
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> favoriteAsyncValue = ref.watch(imageDetailScreenControllerProvider(image.id));
    final AsyncValue<List<model.Image>> favoritesPageAsyncValue = ref.watch(favoritesScreenControllerProvider);

    return AppScaffold(
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