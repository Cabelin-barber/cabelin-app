   import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoadingFullscreen {

    // this is where you would do your fullscreen loading
    static Future<void> startLoading() async {
      return await showDialog<void>(
        context: GlobalContext.context.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent, // can change this to your prefered color
            children: <Widget>[
              Center(
                child: CircularProgressIndicator.adaptive(),
              )
            ],
          );
        },
      );
    }

    static Future<void> stopLoading() async {
      Navigator.of(GlobalContext.context.currentContext!).pop();
    }

    static Future<void> showError(Object? error) async {
      ScaffoldMessenger.of(GlobalContext.context.currentContext!).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              ScaffoldMessenger.of(GlobalContext.context.currentContext!).hideCurrentSnackBar();
            },
          ),
          backgroundColor: Colors.red,
          content: const TextWidget("Erro"),
      ),
    );
  }
}