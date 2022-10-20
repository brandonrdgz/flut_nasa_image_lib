import 'dart:async';

import 'package:flut_nasa_image_lib/models/image_gallery.dart';
import 'package:flut_nasa_image_lib/widgets/common_card.dart';
import 'package:flut_nasa_image_lib/widgets/images/helpers/image_widget_helper.dart';
import 'package:flut_nasa_image_lib/widgets/images/gallery/image_gallery_list_view.dart';
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
  final List<Future<Widget>> _imageWidgetsFutures = [];
  final List<Widget> _imageWidgets = [];
  final StreamController<Widget> _overlayController = StreamController<Widget>.broadcast();

  @override
  void initState() {
    super.initState();
    for(ImageGallery image in widget.imageGallery) {
      _imageWidgetsFutures.add(
        ImageWidgetHelper.getImageWidget(
          imageUrl: image.imageUrl,
        )
      );
    }
  }

  @override
  void dispose() {
    _overlayController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      cardContent: Column(
        children: [
          const ListTile(
            title: Text('Gallery'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: FutureBuilder(
              future: Future.wait(
                _imageWidgetsFutures,
                eagerError: true
              ),
              builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(_imageWidgets.isEmpty) {
                    _imageWidgets.addAll(snapshot.data ?? []);
                  }

                  return ImageGalleryListView(
                    widget: widget,
                    imageWidgets: _imageWidgets,
                    overlayController: _overlayController
                  );
                }

                return const CircularProgressIndicator();
              }
            ),
          ),
        ],
      ),
    );
  }
}