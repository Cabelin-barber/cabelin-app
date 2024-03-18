import 'package:cabelin_v2/models/business_hour_model.dart';
import 'package:cabelin_v2/pages/estableshiment/components/informations/informations_controller.dart';
import 'package:cabelin_v2/utils/day_week_formatter.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/googleMap_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Informations extends StatefulWidget {
  Informations({
    super.key,
    required this.establishmentId
  });

  String establishmentId;

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder(
      init: InformationsController(widget.establishmentId),
      builder: (controller) =>
        controller.establishmentData == null
          ? Center(
              child:LottieBuilder.asset(
                "assets/loading.json",
                width: 100,
              )
            )
          : LayoutWidget(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          primary: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoogleMapWidget(
                latitude: -16.6869,
                longitude: -49.2648,
                address: "{{endereço do estabelecimento}}",
                city: "{{cidade do estabelecimento}}"//booking.establishment.address.city,
              ),
              const TextWidget(
                "{{descricao do estabelecimento}}",
                margin: EdgeInsets.only(top: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    "{{numero de celular}}",
                    margin: EdgeInsets.only(bottom: 16, top: 16)
                  ),
                  ButtonWidget(
                    title: "Ligar",
                    onTap: () async {
                      final call = Uri.parse("tel:62982399800");
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    }
                  )
                ],
              ),
              const Divider(),
              const TextWidget(
                "Horários",
                customFontsize: 22,
                customWeight: FontWeight.w800,
              ),
              ListWidget(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.establishmentData!.openingHours.length,
                itemBuilder: (_, index) {
                  BusinessHours hours = controller.establishmentData!.openingHours[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(DayWeekFormatter.format(hours.dayOfWeek)),
                      TextWidget(
                        "${hours.hourOfService.startHour} - ${hours.hourOfService.startHour}",
                        customWeight: FontWeight.w800
                      )
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}