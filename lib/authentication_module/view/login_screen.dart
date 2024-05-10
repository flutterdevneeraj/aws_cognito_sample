import 'package:aws_cognito_sample/authentication_module/controller/login_controller.dart';
import 'package:aws_cognito_sample/common_module/view/widget/custom_text_field.dart';
import 'package:aws_cognito_sample/utils/colors.dart';
import 'package:aws_cognito_sample/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = Get.put(LoginController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.15,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Form(
                // key: loginController.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Username (Email)',
                      controller: loginController.username,
                      focusNode: loginController.usernameFocus,
                      inputAction: TextInputAction.next,
                      prefixIcon: Images.user,
                      divider: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: loginController.password,
                      focusNode: loginController.passwordFocus,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: Images.lock,
                      isPassword: true,
                      // onSubmit: (text) {},
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                )),
            Container(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    loginController.userAuthentication();
                  },
                  child: Text(
                    "Authenticate",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
