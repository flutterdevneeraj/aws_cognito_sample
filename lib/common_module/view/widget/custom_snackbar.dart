import 'package:aws_cognito_sample/helper/responsive_helper.dart';
import 'package:aws_cognito_sample/utils/dimensions.dart';
import 'package:aws_cognito_sample/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showCustomSnackBar(String message, {bool isError = true, bool getXSnackBar = false}) {
  if(message != null && message.isNotEmpty) {
    if(getXSnackBar) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        message: message,
        maxWidth: Dimensions.WEB_MAX_WIDTH,
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        borderRadius: Dimensions.RADIUS_SMALL,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    }else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          right: ResponsiveHelper.isDesktop(Get.context) ? Get.context!.width*0.7 : Dimensions.PADDING_SIZE_SMALL,
          top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL, left: Dimensions.PADDING_SIZE_SMALL,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
        content: Text(message, style: robotoMedium.copyWith(color: Colors.white)),
      ));
    }
  }
}