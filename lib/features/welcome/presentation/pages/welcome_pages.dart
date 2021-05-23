import 'package:financial_app/features/login/presentation/pages/login.dart';
import 'package:financial_app/features/register/presentation/pages/register.dart';
import 'package:financial_app/shared/images.dart';
import 'package:financial_app/shared/widget/hspace.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePages extends StatelessWidget {
  const WelcomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: 0,
    );
    return Material(
      child: _pages(context, controller),
    );
  }

  _pages(BuildContext context, PageController controller) {
    final _image1 = Images.step1;
    final _image2 = Images.step2;
    final _image3 = Images.step3;
    final _image4 = Images.step4;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: PageView(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: <Widget>[
              _page1(context, _image1),
              _page2(context, _image2),
              _page3(context, _image3),
              _page4(context, _image4),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              VSpace(32),
              _openAccountButton(context),
              VSpace(16),
              _enterButton(context),
            ],
          ),
        ),
      ],
    );
  }

  _page1(BuildContext context, String _image) {
    final _colorDots = Color(0xff00559B);
    final _textStyle = TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontFamily: "dinpro bold",
        fontSize: 24,
        fontWeight: FontWeight.bold);
    final _borderRadius = 16.0;
    final _borderWidth = 2.0;
    final _borderColor = Color(0xffC9C9C8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Olá!",
            style: _textStyle,
          ),
          Text(
            "Agora você tem o jeito",
            style: _textStyle,
          ),
          Text(
            "mais fácil de in vestir na",
            style: _textStyle,
          ),
          Text(
            "Bolsa.",
            style: _textStyle,
          ),
          VSpace(16),
          SvgPicture.asset(_image),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _colorDots,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ],
          ),
          /*  VSpace(32),
          _openAccountButton(context),
          VSpace(16),
          _enterButton(context), */
        ],
      ),
    );
  }

  _page2(BuildContext context, String _image) {
    final _colorDots = Color(0xff00559B);
    final _textStyle = TextStyle(
        color: _colorDots,
        fontFamily: "dinpro bold",
        fontSize: 24,
        fontWeight: FontWeight.bold);
    final _borderRadius = 16.0;
    final _borderWidth = 2.0;
    final _borderColor = Color(0xffC9C9C8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SvgPicture.asset(_image),
          VSpace(32),
          Text(
            "Corretagem Zero",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro bold",
              fontSize: 24,
            ),
          ),
          VSpace(16),
          Text(
            "Aproveite para investir com",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro",
              fontSize: 16,
            ),
          ),
          Text(
            "Corretagem Zero em qualquer tipo",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro bold",
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "de ativo, ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "dinpro bold",
                  fontSize: 16,
                ),
              ),
              Text(
                "inclusive da Bolsa.",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "dinpro",
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _colorDots,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ],
          ),
          /* VSpace(32),
          _openAccountButton(context),
          VSpace(16),
          _enterButton(context), */
        ],
      ),
    );
  }

  _page3(BuildContext context, String _image) {
    final _text = 'Sua vida financeira na palma da sua mão';
    final _colorDots = Color(0xff00559B);
    final _textStyle = TextStyle(
        color: _colorDots,
        fontFamily: "dinpro bold",
        fontSize: 24,
        fontWeight: FontWeight.bold);
    final _borderRadius = 16.0;
    final _borderWidth = 2.0;
    final _borderColor = Color(0xffC9C9C8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SvgPicture.asset(_image),
          VSpace(32),
          Text(
            "Cashback em Fundos",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro bold",
              fontSize: 24,
            ),
          ),
          Text(
            "de Investimento",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro bold",
              fontSize: 24,
            ),
          ),
          VSpace(16),
          Text(
            "Receba parte da taxa de",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro",
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "administração, ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "dinpro",
                  fontSize: 16,
                ),
              ),
              Text(
                "em dinheiro, direto na",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: "dinpro bold",
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            "sua conta Toro.",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontFamily: "dinpro bold",
              fontSize: 16,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _colorDots,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ],
          ),
          /*  VSpace(32),
          _openAccountButton(context),
          VSpace(16),
          _enterButton(context), */
        ],
      ),
    );
  }

  _page4(BuildContext context, String _image) {
    final _text = 'Sua vida financeira na palma da sua mão';
    final _colorDots = Color(0xff00559B);
    final _textStyle = TextStyle(
        color: _colorDots,
        fontFamily: "dinpro bold",
        fontSize: 24,
        fontWeight: FontWeight.bold);
    final _borderRadius = 16.0;
    final _borderWidth = 2.0;
    final _borderColor = Color(0xffC9C9C8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SvgPicture.asset(_image),
          VSpace(32),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff00559B),
                      size: 24,
                    ),
                    HSpace(8),
                    Text(
                      "Recomendações de investimentos",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "dinpro",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                VSpace(16),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff00559B),
                      size: 24,
                    ),
                    HSpace(8),
                    Text(
                      "Cursos do iniciante ao avançado",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "dinpro",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                VSpace(16),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Color(0xff00559B),
                      size: 24,
                    ),
                    HSpace(8),
                    Text(
                      "Invista sabendo quanto pode ganhar",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "dinpro",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _colorDots.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              HSpace(16),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _colorDots,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ],
          ),
          /*  VSpace(32),
          _openAccountButton(context),
          VSpace(16),
          _enterButton(context), */
        ],
      ),
    );
  }

  _openAccountButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
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
            "Abra sua conta grátis",
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
      onTap: () {
        Navigator.push(
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
          "Entrar",
          style: TextStyle(
            fontFamily: "dinpro bold",
            color: Color(0xff2973B2),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
