import 'dart:async';

import 'package:financial_app/core/presentation/pages/home.dart';
import 'package:financial_app/shared/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _backgroundColor = Colors.white;
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => (Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()))));
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
          body: _loading(),
        ),
      ),
    );
  }

  _loading() {
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
