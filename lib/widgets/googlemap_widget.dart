import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse("https://www.google.com/maps/search/?api=1&query=-3.823216,-38.481700");
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $uri';
        }
      },
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: const GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 14.4746,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget("Quadra 27, Lote 2 Casa 1", customFontsize: 13),
                        TextWidget("Goiânia", customFontsize: 13),
                      ],
                    ),
                    SvgPicture.asset("assets/send.svg"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
