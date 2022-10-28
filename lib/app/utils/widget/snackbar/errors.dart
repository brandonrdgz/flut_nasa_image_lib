import 'package:dio/dio.dart';
import 'package:flut_nasa_image_lib/app/ui/widget/common/common_snackbar.dart';
import 'package:flut_nasa_image_lib/app/utils/widget/snackbar/snackbar_messages.dart';
import 'package:flut_nasa_image_lib/generated/l10n.dart';
import 'package:flutter/material.dart';

class Errors {
  static final Map<Type, SnackBarMessages Function(BuildContext, Object)> _errors = {
    DioError: (context, error) {
      DioError dioError = error as DioError;
      SnackBarMessages snackBarMessages;
      Response<dynamic>? response = dioError.response;

      snackBarMessages = SnackBarMessages(
        contentMessage: response != null ?
          S.of(context).serverError :
          S.of(context).networkError,
        actionMessage: response != null ?
          S.of(context).snackBarRetry :
          ''
      );

      return snackBarMessages;
    }
  };

  static SnackBar getErrorSnackbar({
    required BuildContext context,
    required Object error,
    void Function()? onActionPressed
  }) {
    SnackBarMessages Function(BuildContext, Object) messagesFunction =
      _errors[error.runtimeType] ??
      (context, error) => SnackBarMessages(contentMessage: S.of(context).generalError);
    
    SnackBarMessages snackBarMessages = messagesFunction(context, error);

    return CommonSnackbar.snackBar(
      context: context,
      content: Text(
        snackBarMessages.contentMessage,
        style: Theme.of(context).textTheme.button,
      ),
      buildAction: snackBarMessages.hasActionMessage,
      actionText: snackBarMessages.actionMessage,
      onActionPressed: onActionPressed ?? () {},
    );
  }
}