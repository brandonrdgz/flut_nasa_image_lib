import 'package:flut_nasa_image_lib/controllers/favorites/favorites_page_controller.dart';
import 'package:flut_nasa_image_lib/controllers/images/image_detail_page_controller.dart';
import 'package:flut_nasa_image_lib/models/image.dart' as model;
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
      child: const Icon(Icons.favorite_border),
      onTap: () {
        ref.read(imageDetailPageControllerProvider(image.id).notifier)
          .addFavorite();

        ref.read(favoritesPageControllerProvider.notifier).getFavorites();
      },
    );
  }
}