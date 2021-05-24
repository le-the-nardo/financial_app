import 'package:flutter/material.dart';

class NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _backgroundColor = Color(0xffEDF0F8);
    return Scaffold(
      extendBody: true,
      backgroundColor: _backgroundColor,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            "Indisponível no momento",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "dinpro medium",
                fontSize: 25,
                letterSpacing: 2.0),
          ),
        ),
        Column(
          children: [
            _appbar(context),
            Container(),
          ],
        ),
      ],
    );
  }

  _appbar(BuildContext context) {
    final _text = 'Indisponível';
    final _backgroundColor = Color(0xff0A85ED);

    return AppBar(
      title: Text(_text),
      centerTitle: true,
      backgroundColor: _backgroundColor,
      elevation: 0,
    );
  }
}
