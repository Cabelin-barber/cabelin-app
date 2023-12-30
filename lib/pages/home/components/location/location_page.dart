import 'package:cabelin_v2/pages/home/components/location/location_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = LocationController();  
  
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
            margin: const EdgeInsets.only(top: 16),
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
                    Observer(builder: (_)  => TextWidget(
                      color: Colors.grey[600],
                      locationController.currentLocation == null 
                        ?  "Nenhuma" 
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
                      onTap: () => locationController.getLocation()
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
