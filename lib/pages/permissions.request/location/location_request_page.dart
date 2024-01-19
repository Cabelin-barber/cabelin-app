import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RequestLocationPage extends StatelessWidget {
  const RequestLocationPage({super.key});

  @override
  Widget build(BuildContext context) {



  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(GlobalContext.context.currentContext!).showSnackBar(
        const SnackBar(
          content: TextWidget("Serviço de localização não disponivel")
        )
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
    }
    }

    void getPermission()  {
     getLocation().then((_) => context.go("/request_notification"));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget("Precisamos da sua localização para \n que possamos ofercer uma \n melhor experiência na busca \n de estabelecimentos e empresas",
              textAlign: TextAlign.center,

            ),
            Lottie.asset("assets/location.json"),
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