import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/module/images/screen.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/common/common_card.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/images/image_widget_helper.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget{
  final model.Image image;
  late final Future<Widget> _imageWidgetFuture;

  ImageCard({
    required this.image,
    super.key
  }) {
    _imageWidgetFuture = ImageWidgetHelper.getImageWidget(
      imageUrl: image.imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      cardContent: InkWell(
        child: Column(
          children: [
            FutureBuilder<Widget>(
              future: _imageWidgetFuture,
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data ?? Container();
                }
      
                return const CircularProgressIndicator();
              }
            ),
            ListTile(
              title: Text(image.title),
              subtitle: Row(
                children: [
                  AppIcons.location,
                  Text(image.location)
                ],
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.of(context).push<ImageDetailScreen>(
            MaterialPageRoute(builder: (context) => ImageDetailScreen(image: image)),
          );
        },
      ),
    );
  }
}