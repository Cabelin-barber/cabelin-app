import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlert {
  
  static void alert({required String title, required String description,}) {
    showDialog(
      barrierDismissible: false,
      context: GlobalContext.context.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0)
          ), //this right here
          content:  Builder(
            builder: (context) {
              var width = MediaQuery.of(context).size.width;
              return SizedBox(
                height: (MediaQuery.of(context).size.height + description.length) /3,
                width: width -10,
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
                        context.pop();
                      }
                    )
                  ],
                ),
              );
            }
          ),
        );
      }
    );
  }
}