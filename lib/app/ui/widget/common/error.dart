import 'package:flut_nasa_image_lib/app/ui/widget/common/common_info.dart';
import 'package:flut_nasa_image_lib/app/utils/ui/app_icons.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String message;
  
  const Error({
    required this.message,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CommonInfo(
      icon: AppIcons.error,
      message: message
    );
  }
}