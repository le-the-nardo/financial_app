import 'package:flutter/material.dart';

bool _waitActive = false;

  void popWait(BuildContext context) {
    if (_waitActive) {
      Navigator.of(context).pop();
      _waitActive = false;
    }
  }

void showWait(BuildContext context) {
  if (_waitActive) return;

  _waitActive = true;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
