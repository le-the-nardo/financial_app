import 'dart:convert';
import 'dart:io';

import 'package:financial_app/shared/widget/hspace.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffEDF0F8),
        body: _home(context),
      ),
    );
  }

  _home(BuildContext context) {
    final _fit = BoxFit.fitWidth;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            VSpace(64),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on,
                  size: 48,
                ),
                HSpace(8),
                Text(
                  "Carteira",
                  style: TextStyle(
                    fontFamily: "dinpro bold",
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            VSpace(32),
            _titleInformation("Total Investido (R\$):", "936.00"),
            VSpace(32),
            _titleInformation("Minhas ações", ""),
            VSpace(16),
            _cardStock(context, "Símbolo:", "SANB11"),
            VSpace(32),
            _cardStock(context, "Símbolo:", "ITSA3"),
            VSpace(32),
            _cardStock(context, "Símbolo:", "PETR4"),
            VSpace(32),
            _cardStock(context, "Símbolo:", "MGLU3"),
            Divider(),
          ],
        ),
      ),
    );
  }

  _cardStock(BuildContext context, label, result) {
    final _fontFamily = 'dinpro bold';
    final _fontColor = Color(0xff6C6C6C);
    final _fontSize = 16.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffdbd9db),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VSpace(8),
            _positionInformation(label, result),
            _positionInformation("Quantidade:", "5"),
            _positionInformation("Valor ação (R\$):", "28.88"),
            VSpace(16),
            Divider(
              thickness: 2,
            ),
            VSpace(16),
            Text(
              "Quer saber a tendência?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: _fontFamily,
                color: _fontColor,
                fontSize: _fontSize,
              ),
            ),
            InkWell(
              onTap: () {
              },
              child: Text(
                "Ver análise completa",
                style: TextStyle(
                    color: Color(0xff0A85ED),
                    fontFamily: _fontFamily,
                    fontSize: _fontSize,
                    decoration: TextDecoration.underline),
              ),
            ),
            VSpace(16),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  _buttons(BuildContext context) {
    final _borderRadius = BorderRadius.circular(10.0);
    final _textColor1 = Colors.white;
    final _textStyle = TextStyle(
        fontFamily: "dinpro",
        fontSize: 20,
        color: _textColor1,
        fontWeight: FontWeight.bold);

    return Row(
      children: [
        Expanded(
          child: FlatButton(
            height: 42,
            color: Color(0xff0A85ED),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff0A85ED),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            onPressed: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Comprar",
                      style: _textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        HSpace(16),
        Expanded(
          child: FlatButton(
            height: 42,
            color: Color(0xff0A85ED),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff0A85ED),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            onPressed: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Vender",
                      style: _textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _titleInformation(text, _result) {
    final _fontFamily = 'dinpro bold';
    final _fontColor = Color(0xff6C6C6C);
    final _fontSize = 16.0;
    final _fontWeight = FontWeight.w400;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: _fontFamily,
            color: _fontColor,
            fontSize: _fontSize,
            fontWeight: _fontWeight,
          ),
        ),
        HSpace(8),
        Text(
          _result,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: _fontFamily,
            color: _fontColor,
            fontSize: _fontSize,
            fontWeight: _fontWeight,
          ),
        ),
      ],
    );
  }

  _positionInformation(text, _information) {
    final _fontInfo = 'dinpro medium';
    final _fontFamily = 'dinpro bold';
    final _fontColor = Color(0xff6C6C6C);
    final _fontSize = 16.0;
    final _fontWeight = FontWeight.w400;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: _fontInfo,
              color: _fontColor,
              fontSize: _fontSize,
              fontWeight: _fontWeight,
            ),
          ),
          HSpace(8),
          Text(
            _information,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: _fontFamily,
              color: _fontColor,
              fontSize: _fontSize,
              fontWeight: _fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
