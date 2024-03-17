import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlert {
  static void alert({
    required String title,
    required String description,
    void Function()? onTapOk
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        content:  Builder(
          builder: (context) {
            var width = MediaQuery.of(context).size.width;
            return SizedBox(
              height: (MediaQuery.of(context).size.height + description.length) /3,
              width: width - 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title,
                    customWeight: FontWeight.w900,
                    customFontsize: 18,
                  ),
                  const Divider(),
                  TextWidget(description),
                  const Spacer(),
                  ButtonWidget(
                    title: "Ok",
                    fullWidth: true,
                    onTap: () {
                      if(onTapOk == null) {
                        return Get.back();
                      }
                      onTapOk();           
                    }
                  )
                ],
              ),
            );
          }
        ),
      )
    );
  }
}