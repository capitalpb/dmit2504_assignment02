// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:dmit2504_assignment02/main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(get());
  }

  void action() {
    print(text);
  }

  SnackBar get() {
    return SnackBar(
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(Icons.accessibility_new_rounded),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
      action: SnackBarAction(
        label: 'Click Me',
        onPressed: action,
      ),
    );
  }
}
