// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:financial_app/features/login/presentation/pages/login.dart';
import 'package:financial_app/features/register/presentation/pages/register.dart';
import 'package:financial_app/shared/component_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:financial_app/main.dart';

void main() {
  // Test structure
  test('title', () {
    // setup

    // run

    // verify
  });

  // Input tests
  test('Login empty credentials', () {
    var result = CredentialsValidator.verifyEmpty("", "");
    expect(result, true);
  });

  test('Login not empty credentials', () {
    var result = CredentialsValidator.verifyEmpty("username", "password");
    expect(result, false);
  });

  test('Test if bottom bar has 3 items', () {
    var result = componentList.length == 3;
    expect(result, true);
  });
}
