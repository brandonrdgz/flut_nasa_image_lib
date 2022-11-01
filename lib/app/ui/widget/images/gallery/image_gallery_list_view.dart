import 'dart:async';

import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/gallery/image_gallery_overlay.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class ImageGalleryListView extends ConsumerWidget {
  final StreamController<Widget> overlayController;
  final List<String> imagesUrls;

  const ImageGalleryListView({
    required this.overlayController,
    required this.imagesUrls,
    super.key,
  });
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Widget>> imageWidgetAsyncValue = ref.watch(imageWidgetsProvider(imagesUrls));

    return imageWidgetAsyncValue.when(
      data: (images) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: AppSizes.paddingAll,
              child: InkWell(
                child: images[index],
                onTap: () {
                  SwipeImageGallery(
                    context: context,
                    children: images,
                    initialIndex: index,
                    onSwipe: (index) {
                      overlayController.add(ImageGalleryOverlay(
                        title: '${index + 1}/${images.length}',
                      ));
                    },
                    overlayController: overlayController,
                    initialOverlay: ImageGalleryOverlay(
                      title: '${index + 1}/${images.length}',
                    ),
                  ).show();
                },
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}