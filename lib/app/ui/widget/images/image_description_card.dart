import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/common/common_card.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_outlined_button.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/favorites/favorite_red_filled_button.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageDescriptionCard extends StatelessWidget {
  final model.Image image;
  final WidgetRef ref;
  final AsyncValue<bool> favoriteAsyncValue;

  const ImageDescriptionCard({
    required this.image,
    required this.ref,
    required this.favoriteAsyncValue,
    super.key,
  });

  Widget _favoriteButton({
    required bool isFavorite,
    required WidgetRef ref,
  }) {
    if(isFavorite) {
      return FavoriteRedFilledButton(
        image: image,
        ref: ref,
      );
    }
    else {
      return FavoriteOutlinedButton(
        image: image,
        ref: ref,
      );
    }
  }

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
                favoriteAsyncValue.when(
                  data: (isFavorite) {
                    return _favoriteButton(
                      isFavorite: isFavorite,
                      ref: ref
                    );
                  },
                  error: (error, stackTrace) {
                    return _favoriteButton(
                      isFavorite: ref.read(imageDetailScreenControllerProvider(image.id).notifier).isFavorite,
                      ref: ref
                    );
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  }
                ),
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