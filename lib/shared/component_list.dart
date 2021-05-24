import 'package:financial_app/features/graphs/presentation/pages/graphs.dart';
import 'package:financial_app/features/information/presentation/pages/information.dart';
import 'package:financial_app/features/wallet/presentation/pages/wallet.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:financial_app/shared/widget/vspace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentListItem {
  Widget widget;
  Icon icon;
  double iconSize;
  String title;

  ComponentListItem(
      {required this.widget,
      required this.icon,
      required this.iconSize,
      required this.title});
}

List<ComponentListItem> componentList = [
  ComponentListItem(
      widget: Information(),
      icon: Icon(Icons.roofing_sharp),
      iconSize: 32,
      title: 'Início'),
  ComponentListItem(
      widget: /* PaySlip() */ Wallet(),
      icon: Icon(Icons.account_balance_wallet),
      iconSize: 32,
      title: 'Minha carteira'),
  ComponentListItem(
      widget: /* CheckIn() */ Graphs(),
      icon: Icon(Icons.bar_chart),
      iconSize: 64,
      title: 'Gráficos'),
];
