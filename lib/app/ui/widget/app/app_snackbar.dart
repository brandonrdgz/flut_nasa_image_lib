import 'package:flutter/material.dart';

class AppSnackbar {
  static SnackBar snackBar({
    required BuildContext context,
    required Widget content,
    Duration duration = const Duration(seconds: 8),
    bool buildAction = true,
    String actionText = '',
    void Function()? onActionPressed,
  }) {
    return SnackBar(
      backgroundColor: Theme.of(context).cardColor,
      elevation: 4.0,
      content: content,
      duration: duration,
      action: buildAction == false ? null : SnackBarAction(
        textColor: Theme.of(context).primaryTextTheme.button?.color?.withAlpha(128),
        label: actionText,
        onPressed: onActionPressed ?? () {},
      ),
    );
  }
}