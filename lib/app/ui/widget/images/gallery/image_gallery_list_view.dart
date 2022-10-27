import 'dart:async';

import 'package:flut_nasa_image_lib/app/ui/widget/images/gallery/image_gallery_card.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/gallery/image_gallery_overlay.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class ImageGalleryListView extends StatelessWidget {
  final ImageGalleryCard widget;
  final List<Widget> imageWidgets;
  final StreamController<Widget> overlayController;

  const ImageGalleryListView({
    required this.widget,
    required  this.imageWidgets,
    required this.overlayController,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.imageGallery.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: AppSizes.paddingAll,
          child: InkWell(
            child: imageWidgets[index],
            onTap: () {
              SwipeImageGallery(
                context: context,
                children: imageWidgets,
                initialIndex: index,
                onSwipe: (index) {
                  overlayController.add(ImageGalleryOverlay(
                    title: '${index + 1}/${imageWidgets.length}',
                  ));
                },
                overlayController: overlayController,
                initialOverlay: ImageGalleryOverlay(
                  title: '1/${imageWidgets.length}',
                ),
              ).show();
            },
          ),
        );
      }
    );
  }
}