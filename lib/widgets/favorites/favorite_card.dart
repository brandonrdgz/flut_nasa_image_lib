import 'package:flut_nasa_image_lib/models/image.dart' as model;
import 'package:flut_nasa_image_lib/pages/images/image_detail_page.dart';
import 'package:flut_nasa_image_lib/widgets/common_card.dart';
import 'package:flut_nasa_image_lib/widgets/images/helpers/image_widget_helper.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final model.Image favorite;
  late final Future<Widget> _imageWidgetFuture;

  FavoriteCard({
    required this.favorite,
    super.key
  }) {
    _imageWidgetFuture = ImageWidgetHelper.getImageWidget(
      imageUrl: favorite.imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      cardContent: ListTile(
        leading: FutureBuilder(
          future: _imageWidgetFuture,
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return snapshot.data ?? Container();
            }

            return const CircularProgressIndicator();
          },
        ),
        title: Text(favorite.title),
        subtitle: Row(
          children: [
            const Icon(Icons.location_on_outlined),
            Text(favorite.location)
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ImageDetailPage(image: favorite))
          );
        },
      ),
    );
  }
}