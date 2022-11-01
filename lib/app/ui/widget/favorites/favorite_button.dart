import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/widget/app/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  final model.Image image;

  const FavoriteButton({
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Widget> favoriteButtonAsyncValue = ref.watch(favoriteButtonControllerProvider(image.id));

    return favoriteButtonAsyncValue.when(
      data: (favoriteButton) => favoriteButton,
      error: (error, stackTrace) => const Empty(message: ''),
      loading: () => const CircularProgressIndicator(),
    );
  }
}