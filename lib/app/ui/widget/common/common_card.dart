import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget cardContent;

  const CommonCard({
    required this.cardContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingAll,
      child: Card(
        child: cardContent,
      ),
    );
  }
}