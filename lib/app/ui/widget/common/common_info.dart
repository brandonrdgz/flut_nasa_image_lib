import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flutter/material.dart';

class CommonInfo extends StatelessWidget {
  final Widget icon;
  final String message;

  const CommonInfo({
    required this.icon,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSizes.paddingAll,
      child: Center(
        child: Column(
          children: [
            icon,
            Text(
              message,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}