import 'package:cabelin_v2/models/search_location_model.dart';
import 'package:cabelin_v2/pages/explore/components/location/location_controller.dart';
import 'package:cabelin_v2/utils/debouncer.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 1000);
    return GetBuilder(
      init: LocationController(),
      builder: (controller) => Container(
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
                    Get.back();
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
                      TextWidget(
                        color: Colors.grey[600],
                        controller.currentLocation == null
                          ? "Nenhuma"
                          : controller.currentLocation!.city,
                      )
                    ],
                  ),
                    Visibility(
                      visible: controller.currentLocation == null,
                      child: ButtonWidget(
                        title: "Ativar",
                        onTap: () => controller.getLocation()
                      ),
                    )
                ],
              ),
            ),
            CupertinoSearchTextField(
              placeholder: "Insirir uma nova localização",
              controller: controller.searchLocationTextfieldControler,
              onChanged: (String? value) {
                debouncer.run(() {
                  controller.searchLocation(value);
                });
              },
            ),
              Expanded(
                child: ListWidget(
                  isEmpty: controller.searchLocationTextfieldControler.text.isNotEmpty && controller.locationsSearch.isEmpty && !controller.isLoading,
                  itemCount: controller.locationsSearch.length,
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
                    SearchLocationModel location = controller.locationsSearch[index];
                    return GestureDetector(
                      child: ListTile(
                        onTap: () => controller.setLocationSearch(location),
                        leading: const Icon(Icons.place_rounded),
                        title: TextWidget(location.formattedAdress),
                        subtitle: TextWidget(location.fullAdress),
                      ),
                    );
                  }
                ),
              )
          ],
        ),
      ),
    );
  }
}
