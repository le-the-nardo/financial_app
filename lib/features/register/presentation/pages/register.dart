import 'dart:async';

import 'package:financial_app/features/login/presentation/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:financial_app/shared/images.dart';
import 'package:financial_app/shared/strings.dart';
import 'package:financial_app/shared/widget/wait.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import '../../../../user.dart' as user; */

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool selected = false;

  String _username = '';
  String _password = '';
  String _repeatPassword = '';

  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final FocusNode _focusPassword = FocusNode();
  final FocusNode _focusRepeatPassword = FocusNode();

  final _backgroundColor = Colors.white;
  final _textColor = Color(0xff02285A);
  var _showDifferent = false;
  @override
  void initState() {
    super.initState();
    _showDifferent = false;
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
          body: Stack(children: [_RegisterScreen(context)]),
        ),
      ),
    );
  }

  _RegisterScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            VSpace(64),
            _logo(),
            VSpace(32),
            _boasVindas(),
            VSpace(8),
            _subtitulo(),
            VSpace(16),
            _userInput(),
            VSpace(16),
            _passwordInput(),
            VSpace(24),
            _repeatPasswordInput(),
            VSpace(8),
            _showDifferent ? _differentPasswords() : Container(),
            VSpace(42),
            _registerButton(context),
            VSpace(16.0),
            _enterButton(context),
            VSpace(16.0),
          ],
        ),
      ),
    );
  }

  _differentPasswords() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "* Senhas estão diferentes",
          style: TextStyle(
            color: Colors.red,
            fontFamily: "dinpro bold",
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void _doRegister() {
    try {
      if (_username.isEmpty || _password.isEmpty) {
        Fluttertoast.showToast(
          msg: "Por favor, informe o usuário e senha.",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color(0xff0A85ED),
        );
        return;
      }
      showWait(context);
      /*  Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => Home())); */
      //context.bloc<RegisterBloc>().Register(_username, _password);
    } catch (ex) {
      Fluttertoast.showToast(
        msg: ex.toString(),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xff0A85ED),
      );
    }
  }

  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Color(0xff0A85ED).withOpacity(0.4), width: 1),
  );

  final inputBorderEnable = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Color(0xff0A85ED),
      width: 2,
    ),
  );

  _userInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: _textColor, fontFamily: "roboto regular"),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        _username = value;
        print(_username);
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        hintText: "Usuário",
        hintStyle: TextStyle(color: _textColor, fontFamily: "roboto regular"),
        contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        focusedBorder: inputBorderEnable,
        enabledBorder: inputBorder,
      ),
    );
  }

  _passwordInput() {
    return TextFormField(
      obscureText: true,
      focusNode: _focusPassword,
      style: TextStyle(color: _textColor, fontFamily: "roboto regular"),
      textInputAction: TextInputAction.go,
      onChanged: (value) {
        _password = value;
        if (_password.length != _repeatPassword.length) {
          setState(() {
            _showDifferent = true;
          });
        } else {
          setState(() {
            _showDifferent = false;
          });
        }
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusRepeatPassword);
      },
      decoration: InputDecoration(
        hintText: "Senha",
        hintStyle: TextStyle(color: _textColor, fontFamily: "roboto regular"),
        contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        focusedBorder: inputBorderEnable,
        enabledBorder: inputBorder,
      ),
    );
  }

  _repeatPasswordInput() {
    return TextFormField(
      obscureText: true,
      focusNode: _focusRepeatPassword,
      style: TextStyle(color: _textColor, fontFamily: "roboto regular"),
      textInputAction: TextInputAction.go,
      onChanged: (value) {
        _repeatPassword = value;
        if (_password.length != _repeatPassword.length) {
          setState(() {
            _showDifferent = true;
          });
        } else {
          setState(() {
            _showDifferent = false;
          });
        }
      },
      onFieldSubmitted: (value) {
        _doRegister();
      },
      decoration: InputDecoration(
        hintText: "Repita a senha",
        hintStyle: TextStyle(color: _textColor, fontFamily: "roboto regular"),
        contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        focusedBorder: inputBorderEnable,
        enabledBorder: inputBorder,
      ),
    );
  }

  _boasVindas() {
    final _text = Strings.registerTitle;
    final _textAlign = TextAlign.center;
    final _fontSize = 24.0;
    final _fontFamily = "dinpro bold";

    return Text(
      _text,
      style: TextStyle(
        color: _textColor,
        fontFamily: _fontFamily,
        fontSize: _fontSize,
      ),
      textAlign: _textAlign,
    );
  }

  _subtitulo() {
    final _text = Strings.register;
    final _fontFamily = "dinpro bold";
    final _fontSize = 14.0;
    final _textAlign = TextAlign.center;

    return Text(
      _text,
      style: TextStyle(
        color: _textColor,
        fontFamily: _fontFamily,
        fontSize: _fontSize,
      ),
      textAlign: _textAlign,
    );
  }

  _registerButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _doRegister();
      },
      child: Container(
        height: 52.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xff00559B)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Registrar",
            style: TextStyle(
                fontFamily: "dinpro bold",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _enterButton(BuildContext context) {
    return GestureDetector(
      key: Key("alreadyHaveAccount"),
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Container(
        height: 52.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff2973B2), width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white),
        child: Text(
          "Já tenho uma conta",
          style: TextStyle(
            fontFamily: "dinpro bold",
            color: Color(0xff2973B2),
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _logo() {
    final _image = Images.logoTransparent;
    final _testPng = Image(image: AssetImage(_image));

    final _imageHeight = selected ? 50.0 : 72.0;
    final _imageWidth = selected ? 200.0 : 260.0;

    final _alignment = Alignment.center;

    return Align(
      alignment: _alignment,
      child:
          SizedBox(height: _imageHeight, width: _imageWidth, child: _testPng),
    );
  }
}
