import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  const VSpace(this.height);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
