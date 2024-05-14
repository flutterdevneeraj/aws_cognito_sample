import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../common_module/view/widget/custom_snackbar.dart';

class RegistrationController extends GetxController {
  late FocusNode firstnameFocus = FocusNode();
  late FocusNode lastnameFocus = FocusNode();
  late FocusNode usernameFocus = FocusNode();
  late FocusNode passwordFocus = FocusNode();
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController username;
  late TextEditingController password;
  var data;

  @override
  void onInit() {
    firstnameFocus = FocusNode();
    lastnameFocus = FocusNode();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    firstname = TextEditingController();
    lastname = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  final userPool = CognitoUserPool(
    '${(dotenv.env['POOL_ID'])}',
    '${(dotenv.env['CLIENT_ID'])}',
  );

  registerUser() async {
    String firstName = firstname.text.trim();
    String lastName = lastname.text.trim();
    String user = username.text.trim();
    String pass = password.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBar('Enter firstname');
    } else if (lastName.isEmpty) {
      showCustomSnackBar('Enter lastname');
    } else if (user.isEmpty) {
      showCustomSnackBar('Enter username');
    } else if (pass.isEmpty) {
      showCustomSnackBar('Enter password');
    } else {
      final userAttributes = [
        AttributeArg(name: 'first_name', value: firstName),
        AttributeArg(name: 'last_name', value: lastName),
      ];
      try {
        data = await userPool.signUp(
          user,
          pass,
          userAttributes: userAttributes,
        );
        print(data);
      } catch (e) {
        print(e);
      }
    }
  }
}
