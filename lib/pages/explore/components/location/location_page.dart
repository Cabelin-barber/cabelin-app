import 'package:cabelin_v2/models/search_location_model.dart';
import 'package:cabelin_v2/pages/explore/components/location/location_controller.dart';
import 'package:cabelin_v2/utils/debouncer.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  final locationController = LocationController();
  
  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 400);
    return Container(
      padding: const EdgeInsets.all(22),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                "Localização",
                customWeight: FontWeight.w800,
                customFontsize: 22,
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.close_rounded),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      "Localização atual",
                      customFontsize: 20,
                    ),
                    Observer(
                      builder: (_) => TextWidget(
                        color: Colors.grey[600],
                        locationController.currentLocation == null
                          ? "Nenhuma"
                          : locationController.currentLocation!.city,
                      )
                    )
                  ],
                ),
                Observer(
                  builder: (context) => Visibility(
                    visible: locationController.currentLocation == null,
                    child: ButtonWidget(
                      title: "Ativar",
                      onTap: () => locationController.getLocation()),
                  )
                ),
              ],
            ),
          ),
          CupertinoSearchTextField(
            placeholder: "Insirir uma nova localização",
            controller: locationController.searchLocationTextfieldControler,
            onChanged: (String? value) {
              debouncer.run(() {
                locationController.searchLocation(value);
              });
            },
          ),
          Observer(builder: (_) {
            return Expanded(
              child: ListWidget(
                isEmpty: locationController.searchLocationTextfieldControler.text.isNotEmpty 
                  && locationController.locationsSearch.isEmpty,
                itemCount: locationController.locationsSearch.length,
                customEmpty: Column(
                  children: [
                    LottieBuilder.asset(
                      "assets/empty.json",
                    ),
                    const TextWidget(
                      "Parece que você escreveu\n a localizão errada",
                      textAlign: TextAlign.center
                    )
                  ],
                ),
                itemBuilder: (_, index) {
                  SearchLocationModel location = locationController.locationsSearch[index];
                  return GestureDetector(
                    child: ListTile(
                      onTap: () => locationController.setLocationSearch(location),
                      leading: const Icon(Icons.place_rounded),
                      title: TextWidget(location.formattedAdress),
                      subtitle: TextWidget(location.fullAdress),
                    ),
                  );
                }
              ),
            );
          })
        ],
      ),
    );
  }
}
