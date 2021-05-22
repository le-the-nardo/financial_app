import 'dart:async';

/* import 'package:financial_app/core/presentation/pages/home.dart'; */
//import 'package:financial_app/features/change_password/presentation/pages/change_password.dart';
//import 'package:financial_app/features/login/presentation/bloc/login_bloc.dart';
//import 'package:financial_app/features/login/presentation/bloc/notification_token_bloc.dart';
//import 'package:financial_app/features/recover_password/presentation/pages/recover_password.dart';
/* import 'package:financial_app/shared/strings.dart';
import 'package:financial_app/shared/svg_images.dart';
import 'package:financial_app/shared/widget/not_available.dart'; */
import 'package:financial_app/features/welcome/presentation/pages/welcome_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:financial_app/shared/images.dart';
import 'package:financial_app/shared/strings.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:financial_app/shared/widget/wait.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import '../../../../user.dart' as user; */

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
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

    Timer(
        Duration(seconds: 7),
        () => (Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePages()))

            /* setState(
        () {
          selected = !selected;
        },
      ), */
            ));
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
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: selected ? 70 : (MediaQuery.of(context).size.height / 2),
              left: 30,
              right: 30,
              curve: Curves.easeIn,
              child: _logo(),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: 170,
              left: 30,
              right: 30,
              curve: Curves.easeIn,
              child: selected
                  ? _loginScreen(context)
                  /* BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          _loginBlocHandler(state, context);
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _boasVindas(),
                              VSpace(8),
                              _subtitulo(),
                              VSpace(16),
                              _entradaUsuario(),
                              VSpace(16),
                              _entradaSenha(),
                              VSpace(16),
                              _esqueceuSenha(),
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
                  : Container(),
            ),
          ]),
        ),
      ),
    );
  }

  _loginScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _boasVindas(),
          VSpace(8),
          _subtitulo(),
          VSpace(16),
          _entradaUsuario(),
          VSpace(16),
          _entradaSenha(),
          VSpace(16),
          _esqueceuSenha(),
          VSpace(24),
          _acessButton(context),
          VSpace(16.0),
          _registerButton(context),
          VSpace(40),
        ],
      ),
    );
  }

  /* void _loginBlocHandler(LoginState state, BuildContext context) async {
    if (state is Authenticated) {
      popWait(context);

      if (state.token.changePassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChangePassword(login: true, oldPassword: _password)),
        );
      } else {
        var notificationToken = await FirebaseMessaging().getToken();

        context
            .bloc<NotificationTokenBloc>()
            .add(NotificationTokenLoad(notificationToken: notificationToken));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    } else if (state is LoginError) {
      popWait(context);

      _scaffoldStateKey.currentState.showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    }
  } */

  void _doLogin() {
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

  _entradaUsuario() {
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

  _entradaSenha() {
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

  _boasVindas() {
    final _text = Strings.bemVindoLogin;
    final _textAlign = TextAlign.center;
    final _fontSize = 16.0;
    final _fontFamily = "roboto bold";

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
    final _text = Strings.subtituloLogin;
    final _fontFamily = "roboto regular";
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

  _esqueceuSenha() {
    final _mainAxisAlignment = MainAxisAlignment.center;

    final _text1 = Strings.esqueceuSenhaLogin;
    final _text2 = Strings.cliqueAquiLogin;
    final _fontSize = 16.0;
    final _fontFamily = "roboto regular";
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
                fontFamily: "roboto bold",
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
      onTap: () {
        print("registrar -se");
      },
      child: Container(
        height: 52.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: _textColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
            color: _backgroundColor),
        child: Text(
          "Registre-se agora",
          style: TextStyle(
            fontFamily: "roboto bold",
            color: Colors.black,
            fontSize: 17,
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
