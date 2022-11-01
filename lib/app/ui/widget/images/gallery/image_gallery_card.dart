import 'dart:async';

import 'package:flut_nasa_image_lib/app/core/module/images/image_gallery.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/app/app_card.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/images/gallery/image_gallery_list_view.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/widget_ext.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';

class ImageGalleryCard extends StatefulWidget {
  final List<ImageGallery> imageGallery;

  const ImageGalleryCard({
    required this.imageGallery,
    super.key,
  });

  @override
  State<ImageGalleryCard> createState() => _ImageGalleryCardState();
}

class _ImageGalleryCardState extends State<ImageGalleryCard> {
  final StreamController<Widget> _overlayController = StreamController<Widget>.broadcast();

  @override
  void dispose() {
    _overlayController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      cardContent: Column(
        children: [
          ListTile(
            title: Text(S.of(context).gallery),
          ),
          ImageGalleryListView(
            overlayController: _overlayController,
            imagesUrls: widget.imageGallery.map<String>((imageGallery) => imageGallery.imageUrl).toList(),
          ).sizedBox(height: MediaQuery.of(context).size.height / 4),
        ],
      ),
    );
  }
}