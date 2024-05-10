import 'package:aws_cognito_sample/authentication_module/view/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(LoginScreen());
    });
    // TODO: implement onInit
    super.onInit();
  }
}
