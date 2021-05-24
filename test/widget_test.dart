import 'package:financial_app/features/login/presentation/pages/login.dart';
import 'package:financial_app/shared/component_list.dart';
import 'package:flutter_test/flutter_test.dart';

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
