import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteOutlinedButton extends StatelessWidget {
  final model.Image image;
  final WidgetRef ref;

  const FavoriteOutlinedButton({
    required this.image,
    required this.ref,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AppIcons.favoriteBorder,
      onTap: () {
        ref.read(imageDetailScreenControllerProvider(image.id).notifier)
          .addFavorite();

        ref.read(favoritesScreenControllerProvider.notifier).getFavorites();
      },
    );
  }
}