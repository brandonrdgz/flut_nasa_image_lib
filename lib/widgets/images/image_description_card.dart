import 'package:flut_nasa_image_lib/controllers/images/image_detail_page_controller.dart';
import 'package:flut_nasa_image_lib/widgets/common_card.dart';
import 'package:flut_nasa_image_lib/models/image.dart' as model;
import 'package:flut_nasa_image_lib/widgets/favorites/favorite_outlined_button.dart';
import 'package:flut_nasa_image_lib/widgets/favorites/favorite_red_filled_button.dart';
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
                Text(image.title),
                favoriteAsyncValue.when(
                  data: (isFavorite) {
                    return _favoriteButton(
                      isFavorite: isFavorite,
                      ref: ref
                    );
                  },
                  error: (error, stackTrace) {
                    return _favoriteButton(
                      isFavorite: ref.read(imageDetailPageControllerProvider(image.id).notifier).isFavorite,
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
                const Icon(Icons.location_on_outlined),
                Text(image.location)
              ],
            ),
          ),
          ListTile(
            title: const Text('Description'),
            subtitle: Text(image.description),
          )
        ],
      ),
    );
  }
}