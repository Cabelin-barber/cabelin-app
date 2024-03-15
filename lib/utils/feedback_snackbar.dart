import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackSnackbar {


  static success(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: TextWidget(message)
      )
    );
  }

  static error(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: TextWidget(message)
      )
    );
  }

}