import 'package:flut_nasa_image_lib/app/utils/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const IconData _favoriteIconData = Icons.favorite;
  static const IconData _favoriteBorderIconData = Icons.favorite_border;

  static const Icon favoriteFilledRed = Icon(
    _favoriteIconData,
    color: AppColors.favoriteButton,
  );

  static const Icon favoriteFilled = Icon(_favoriteIconData);

  static const Icon favoriteBorder = Icon(
    _favoriteBorderIconData,
  );

  static const Icon delete = Icon(Icons.delete);
  static const Icon list = Icon(Icons.list);
  static const Icon info = Icon(Icons.info_outline);

  static const Icon error = Icon(
    Icons.error_outline,
    color: AppColors.error,
  );

  static const Icon location = Icon(Icons.location_on_outlined);
  static const Icon close = Icon(Icons.close);
}