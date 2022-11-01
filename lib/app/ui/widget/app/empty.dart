import 'package:flut_nasa_image_lib/app/ui/widget/app/info.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String message;

  const Empty({
    required this.message,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Info(
      icon: AppIcons.info,
      message: message
    );
  }
}