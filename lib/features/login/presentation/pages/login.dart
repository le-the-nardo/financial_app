import 'dart:async';
import 'package:financial_app/features/register/presentation/pages/register.dart';
import 'package:financial_app/shared/widget/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:financial_app/shared/images.dart';
import 'package:financial_app/shared/strings.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';*/

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool selected = false;

  String _username = '';
  String _password = '';

  String _version = '';

  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final FocusNode _focusPassword = FocusNode();

  final _backgroundColor = Colors.white;
  final _textColor = Color(0xff02285A);
  @override
  void initState() {
    super.initState();
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
          body: Stack(children: [
            _loginScreen(context)
            /* BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          _loginBlocHandler(state, context);
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _welcome(),
                              VSpace(8),
                              _subtitle(),
                              VSpace(16),
                              _enterUser(),
                              VSpace(16),
                              _enterPassword(),
                              VSpace(16),
                              _forgotPassword(),
                              VSpace(24),
                              _acessButton(context),
                              VSpace(16.0),
                              _registerButton(context),
                              VSpace(40),
                              _versionamento(),
                              VSpace(16),
                            ],
                          ),
                        ),
                      ) */
          ]),
        ),
      ),
    );
  }

  _loginScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            VSpace(64),
            _logo(),
            VSpace(32),
            _welcome(),
            VSpace(8),
            _subtitle(),
            VSpace(16),
            _enterUser(),
            VSpace(16),
            _enterPassword(),
            VSpace(16),
            _forgotPassword(),
            VSpace(24),
            _acessButton(context),
            VSpace(16.0),
            _registerButton(context),
          ],
        ),
      ),
    );
  }

  void _doLogin() {
    try {
      if (CredentialsValidator.verifyEmpty(_username, _password)) {
        Fluttertoast.showToast(
          msg: "Por favor, informe o usuário e senha.",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color(0xff0A85ED),
        );
        return;
      }
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) => Loading()));
      //context.bloc<LoginBloc>().login(_username, _password);
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

  _enterUser() {
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

  _enterPassword() {
    return TextFormField(
      obscureText: true,
      focusNode: _focusPassword,
      style: TextStyle(color: _textColor, fontFamily: "roboto regular"),
      textInputAction: TextInputAction.go,
      onChanged: (value) {
        _password = value;
      },
      onFieldSubmitted: (value) {
        _doLogin();
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

  _welcome() {
    final _text = Strings.bemVindoLogin;
    final _textAlign = TextAlign.center;
    final _fontSize = 20.0;
    final _fontFamily = "dinpro medium";

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

  _subtitle() {
    final _text = Strings.subtituloLogin;
    final _fontFamily = "dinpro medium";
    final _fontSize = 16.0;
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

  _forgotPassword() {
    final _mainAxisAlignment = MainAxisAlignment.center;

    final _text1 = Strings.esqueceuSenhaLogin;
    final _text2 = Strings.cliqueAquiLogin;
    final _fontSize = 16.0;
    final _fontFamily = "dinpro medium";
    final _fontDecoration = TextDecoration.underline;

    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      children: [
        Text(
          _text1,
          style: TextStyle(
              color: _textColor, fontFamily: _fontFamily, fontSize: _fontSize),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => /* RecoverPassword() */ NotAvailable()));
          },
          child: Text(
            _text2,
            style: TextStyle(
                color: _textColor,
                fontFamily: _fontFamily,
                fontSize: _fontSize,
                decoration: _fontDecoration),
          ),
        ),
      ],
    );
  }

  _acessButton(BuildContext context) {
    return GestureDetector(
      key: Key("accessButton"),
      onTap: () {
        print("logar");
        _doLogin();
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
            "Acessar",
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

  _registerButton(BuildContext context) {
    return GestureDetector(
      key: Key("registerButton"),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
      },
      child: Container(
        height: 52.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff00559B), width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
            color: _backgroundColor),
        child: Text(
          "Registrar-se",
          style: TextStyle(
            fontFamily: "dinpro bold",
            color: Color(0xff00559B),
            fontSize: 16,
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

class CredentialsValidator {
  static bool verifyEmpty(String username, String password) {
    return (username.isEmpty || password.isEmpty) ? true : false;
  }
}
