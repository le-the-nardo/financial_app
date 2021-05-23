//import 'package:financial_app/features/check_in/presentation/pages/check_in_page.dart';
//import 'package:financial_app/features/payslip/presentation/pages/payslip.dart';
//import 'package:financial_app/features/user_data/presentation/pages/user_data.dart';
import 'package:financial_app/shared/widget/not_available.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './images.dart';
import 'package:flutter_svg/svg.dart';

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
      widget: NotAvailable(),
      icon: Icon(Icons.check_box),
      iconSize: 32,
      title: 'Início'),
  ComponentListItem(
      widget: /* PaySlip() */ NotAvailable(),
      icon: Icon(Icons.check_box),
      iconSize: 32,
      title: 'Doar'),
  ComponentListItem(
      widget: /* CheckIn() */ NotAvailable(),
      icon: Icon(Icons.check_box),
      iconSize: 64,
      title: 'Comunidade'),
  ComponentListItem(
      widget: /* UserData() */ NotAvailable(),
      icon: Icon(Icons.check_box),
      iconSize: 32,
      title: 'Perfil'),
  /* ComponentListItem(
      widget: Container(),
      icon: Images.inicio,
      iconSize: 32,
      title: 'Menu'), */
];
