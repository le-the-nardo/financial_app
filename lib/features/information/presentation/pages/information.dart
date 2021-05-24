import 'package:financial_app/core/presentation/bloc/home_bloc.dart';
import 'package:financial_app/shared/widget/hspace.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Information extends StatelessWidget {
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
    final _borderRadius = BorderRadius.circular(8.0);

    return Column(
      children: [
        VSpace(64),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Olá, ",
                    style: TextStyle(
                      fontFamily: "dinpro bold",
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Leonardo",
                    style: TextStyle(
                      fontFamily: "dinpro bold",
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        VSpace(16),
        _cardInfo(context),
        Spacer(),
        _sliderIcons(_borderRadius),
        VSpace(32),
      ],
    );
  }

  SingleChildScrollView _sliderIcons(BorderRadius _borderRadius) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HSpace(16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color(0xff0A85ED),
            ),
            child: Icon(
              Icons.attach_money_sharp,
              size: 48,
              color: Colors.white,
            ),
          ),
          HSpace(16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color(0xff0A85ED),
            ),
            child: Icon(
              Icons.share,
              size: 48,
              color: Colors.white,
            ),
          ),
          HSpace(16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color(0xff0A85ED),
            ),
            child: Icon(
              Icons.qr_code,
              size: 48,
              color: Colors.white,
            ),
          ),
          HSpace(16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color(0xff0A85ED),
            ),
            child: Icon(
              Icons.redeem_rounded,
              size: 48,
              color: Colors.white,
            ),
          ),
          HSpace(16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color(0xff0A85ED),
            ),
            child: Icon(
              Icons.restaurant_outlined,
              size: 48,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _cardInfo(BuildContext context) {
    final _borderRadius = BorderRadius.circular(8.0);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            context.read<HomeBloc>().add(HomeIndexChange(index: 1));
          },
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [Icon(Icons.attach_money_sharp)],
                    ),
                    VSpace(32),
                    Row(
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Saldo: ",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: "R\$ 1500,00",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    VSpace(16),
                    Divider(
                      thickness: 2,
                    ),
                    VSpace(16),
                    Row(
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Transferência de R\$ 414,00",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: " recebida",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "de João Almeida",
                                    style: TextStyle(
                                        fontFamily: "dinpro bold",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                        HSpace(16),
                        Icon(Icons.chevron_right_outlined)
                      ],
                    ),
                    VSpace(16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
