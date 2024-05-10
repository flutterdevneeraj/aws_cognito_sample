import 'package:aws_cognito_sample/splash_module/controller/splash_controller.dart';
import 'package:aws_cognito_sample/utils/colors.dart';
import 'package:aws_cognito_sample/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(SplashController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Welcome"),
      // ),
      body: Center(
        child: Text(
          MyStrings.appName,
          style: TextStyle(fontSize: 35, color: MyColors.black),
        ),
      ),
    );
  }
}
