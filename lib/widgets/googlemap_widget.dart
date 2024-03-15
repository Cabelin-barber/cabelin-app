import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapWidget extends StatelessWidget {

  double latitude;
  double longitude;
  String address;
  String city;

  GoogleMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse("https://www.google.com/maps/search/?api=1&query=${longitude},${latitude}");
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
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(address, customFontsize: 13),
                        TextWidget(city, customFontsize: 13),
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
