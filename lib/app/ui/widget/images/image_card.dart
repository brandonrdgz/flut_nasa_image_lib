import 'package:flut_nasa_image_lib/app/core/di.dart';
import 'package:flut_nasa_image_lib/app/core/module/images/image.dart' as model;
import 'package:flut_nasa_image_lib/app/ui/module/images/screen.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/common/common_card.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageCard extends ConsumerWidget {
  final model.Image image;

  const ImageCard({
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Widget> imageWidgetAsyncValue = ref.watch(imageWidgetProvider(image.imageUrl));

    return CommonCard(
      cardContent: InkWell(
        child: Column(
          children: [
            imageWidgetAsyncValue.when(
              data: (image) => image,
              error: (error, stackTrace) => Container(),
              loading: () => const CircularProgressIndicator(),
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