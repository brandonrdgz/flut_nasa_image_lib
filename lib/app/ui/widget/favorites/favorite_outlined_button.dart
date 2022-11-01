import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';

class FavoriteOutlinedButton extends StatelessWidget {
  final void Function() onPressed;

  const FavoriteOutlinedButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AppIcons.favoriteBorder,
    );
  }
}