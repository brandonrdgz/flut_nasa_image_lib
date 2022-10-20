import 'package:flut_nasa_image_lib/widgets/common_info.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String message;

  const Empty({
    required this.message,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CommonInfo(
      icon: const Icon(Icons.info_outline),
      message: message
    );
  }
}