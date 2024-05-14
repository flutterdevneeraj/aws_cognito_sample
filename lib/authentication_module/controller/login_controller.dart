import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:aws_cognito_sample/common_module/view/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  late FocusNode usernameFocus = FocusNode();
  late FocusNode passwordFocus = FocusNode();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() {
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    username  = TextEditingController();
    password  = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  final userPool = CognitoUserPool(
    '${(dotenv.env['POOL_ID'])}',
    '${(dotenv.env['CLIENT_ID'])}',
  );

  Future userAuthentication() async {
    String user = username.text.trim();
    String pass = password.text.trim();
    if (user.isEmpty) {
      showCustomSnackBar('Enter username');
    }else if(pass.isEmpty){
      showCustomSnackBar('Enter password');
    }else{
      debugPrint('Authenticating User...');
      final cognitoUser = CognitoUser(username.text, userPool);
      final authDetails = AuthenticationDetails(
        username: username.text,
        password: password.text,
      );
      CognitoUserSession? session;
      try {
        session = await cognitoUser.authenticateUser(authDetails);
        debugPrint('Login Success...');
      } on CognitoUserNewPasswordRequiredException catch (e) {
        debugPrint('CognitoUserNewPasswordRequiredException $e');
      } on CognitoUserMfaRequiredException catch (e) {
        debugPrint('CognitoUserMfaRequiredException $e');
      } on CognitoUserSelectMfaTypeException catch (e) {
        debugPrint('CognitoUserMfaRequiredException $e');
      } on CognitoUserMfaSetupException catch (e) {
        debugPrint('CognitoUserMfaSetupException $e');
      } on CognitoUserTotpRequiredException catch (e) {
        debugPrint('CognitoUserTotpRequiredException $e');
      } on CognitoUserCustomChallengeException catch (e) {
        debugPrint('CognitoUserCustomChallengeException $e');
      } on CognitoUserConfirmationNecessaryException catch (e) {
        debugPrint('CognitoUserConfirmationNecessaryException $e');
      } on CognitoClientException catch (e) {
        debugPrint('CognitoClientException $e');
      } catch (e) {
        print(e);
      }
    }
  }

  void login() {}
}