import 'package:flut_nasa_image_lib/app/utils/ui/app_colors.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/widget_ext.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';

class ImageGalleryOverlay extends StatelessWidget {
  final String title;

  const ImageGalleryOverlay ({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.imageGalleryOverlayBackground,
          padding: AppSizes.paddingAll,
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.imageGalleryOverlayText,
              decoration: TextDecoration.none,
              fontSize: AppSizes.imageGalleryOverlayFont,
            ),
          ),
        ),
        IconButton(
          icon: AppIcons.close,
          color: AppColors.imageGalleryOverlayText,
          tooltip: S.of(context).close,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ).safeArea();
  }
}