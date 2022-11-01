import 'package:flut_nasa_image_lib/app/utils/ui/app_sizes.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/widget_ext.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final Widget icon;
  final String message;

  const Info({
    required this.icon,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSizes.paddingAll,
      child: Column(
        children: [
          icon,
          Text(
            message,
            textAlign: TextAlign.justify,
          ),
        ],
      ).center(),
    );
  }
}