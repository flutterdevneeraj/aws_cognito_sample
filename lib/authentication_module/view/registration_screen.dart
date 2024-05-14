import 'package:aws_cognito_sample/authentication_module/controller/registration_controller.dart';
import 'package:aws_cognito_sample/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_module/view/widget/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationController registrationController;
  @override
  void initState() {
    registrationController = Get.put(RegistrationController());
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
              "Registration",
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
                      hintText: 'First Name',
                      controller: registrationController.firstname,
                      focusNode: registrationController.firstnameFocus,
                      inputAction: TextInputAction.next,
                      prefixIcon: Images.user,
                      divider: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Last Name',
                      controller: registrationController.lastname,
                      focusNode: registrationController.lastnameFocus,
                      inputAction: TextInputAction.next,
                      prefixIcon: Images.user,
                      divider: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Username (Email)',
                      controller: registrationController.username,
                      focusNode: registrationController.usernameFocus,
                      inputAction: TextInputAction.next,
                      prefixIcon: Images.user,
                      divider: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: registrationController.password,
                      focusNode: registrationController.passwordFocus,
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
                    registrationController.registerUser();
                  },
                  child: Text(
                    "Register",
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
