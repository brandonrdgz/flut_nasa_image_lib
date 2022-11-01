import 'package:flut_nasa_image_lib/app/ui/widget/common/common_card.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_button.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';

class ImageDescriptionCard extends StatelessWidget {
  final model.Image image;

  const ImageDescriptionCard({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      cardContent: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(image.title)
                ),
                FavoriteButton(image: image),
              ],
            ),
            subtitle: Row(
              children: [
                AppIcons.location,
                Flexible(
                  child: Text(image.location)
                )
              ],
            ),
          ),
          ListTile(
            title: Text(S.of(context).description),
            subtitle: Text(image.description),
          )
        ],
      ),
    );
  }
}