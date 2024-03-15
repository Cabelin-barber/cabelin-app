import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingFullscreen {

    static void startLoading() async {
      Get.dialog(
        const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator.adaptive(),
            )
          ],
        )
      );
    }

    static stopLoading() {
      Get.close(1);
    }
}