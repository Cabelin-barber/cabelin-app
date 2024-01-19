import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationRequestPage extends StatelessWidget {
  const NotificationRequestPage({super.key});



  @override
  Widget build(BuildContext context) {

    Future<void> getLocation() async {
      var status = await Permission.notification.status;

      if(status.isDenied) {
        await Permission.notification.request();
      }

      if(status.isPermanentlyDenied) {
        await openAppSettings();
      }
    }

    void getPermission()  {
      getLocation().then((_) => context.go("/"));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget("Ative as notificações para saber sobre \n promoções, novidades e para ser avisado sobre algo relevante",
              textAlign: TextAlign.center,

            ),
            Lottie.asset("assets/notifications.json"),
            ButtonWidget(
              title: "Ok",
              fullWidth: true,
              onTap: () {
                getPermission();
              }
            )
          ],
        ),
      ),
    );
  }
}