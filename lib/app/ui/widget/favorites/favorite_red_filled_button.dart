import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';

class FavoriteRedFilledButton extends StatelessWidget {
  final void Function() onTap;

  const FavoriteRedFilledButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppIcons.favoriteFilledRed,
    );
  }
}