import 'package:flut_nasa_image_lib/widgets/common_info.dart';
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
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
      message: message
    );
  }
}