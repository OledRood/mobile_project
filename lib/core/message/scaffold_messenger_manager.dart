import 'package:flutter/material.dart';

class ScaffoldMessengerManager {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void hideCurrentSnackBar() {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }
}
