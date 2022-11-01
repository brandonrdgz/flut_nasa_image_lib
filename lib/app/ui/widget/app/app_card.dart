import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/widget_ext.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget cardContent;

  const AppCard({
    required this.cardContent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: cardContent,
    ).padding(AppSizes.paddingAll);
  }
}