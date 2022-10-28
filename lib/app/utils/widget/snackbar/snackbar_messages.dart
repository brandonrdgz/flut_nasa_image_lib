class SnackBarMessages {
  final String contentMessage;
  late bool hasActionMessage;
  final String actionMessage;

  SnackBarMessages({
    required this.contentMessage,
    this.actionMessage = '',
  }) {
    hasActionMessage = actionMessage.isNotEmpty;
  }
}