import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RequestLocationPage extends StatelessWidget {
  const RequestLocationPage({super.key});

  @override
  Widget build(BuildContext context) {

  final userLocationStorageRepository = GetIt.instance<UserLocationStorageRepository>();

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

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      LoadingFullscreen.startLoading();
      var current = await Geolocator.getCurrentPosition();
      List<Placemark> places = await placemarkFromCoordinates(current.latitude, current.longitude);
      Placemark locationAddress = places[0];
      LocationModel userLocation = LocationModel(
        city: locationAddress.subAdministrativeArea!,
        state: locationAddress.administrativeArea!,
        latitude: current.latitude.toString(),
        longitude: current.latitude.toString(),
      );
      await userLocationStorageRepository.saveUserLocation(userLocation);
      LoadingFullscreen.stopLoading();
    }
  }

    void getPermission() {
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