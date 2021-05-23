import 'dart:async';

import 'package:financial_app/features/welcome/presentation/pages/welcome_pages.dart';
import 'package:financial_app/shared/images.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _backgroundColor = Colors.white;
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 7),
        () => (Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePages()))));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: _backgroundColor,
          key: _scaffoldStateKey,
          extendBody: true,
          body: _logo(),
        ),
      ),
    );
  }

  _logo() {
    final _image = Images.logoTransparent;
    final _logo = Image(image: AssetImage(_image));
    final _imageLoading = Images.loading;
    final _loading = Image(image: AssetImage(_imageLoading));
    final _imageHeight = 72.0;
    final _imageWidth = 260.0;

    final _alignment = Alignment.center;

    return Align(
      alignment: _alignment,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: _imageHeight, width: _imageWidth, child: _logo),
          VSpace(32),
          SizedBox(
            height: _imageHeight,
            width: _imageWidth,
            child: _loading,
          ),
        ],
      ),
    );
  }
}
