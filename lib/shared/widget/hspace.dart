import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace(this.width);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
