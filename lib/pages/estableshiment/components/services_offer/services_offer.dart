
import 'package:cabelin_v2/pages/estableshiment/components/services_offer/service_offer_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ServicesOfferPage extends StatefulWidget {

  ServicesOfferPage({
    super.key,
    required this.establishmentId
  });

  String establishmentId;

  @override
  State<ServicesOfferPage> createState() => _ServicesOfferPageState();
}

class _ServicesOfferPageState extends State<ServicesOfferPage> with AutomaticKeepAliveClientMixin{
  

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder(
      init: ServiceOfferController(establishmentId: widget.establishmentId),
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(16),
        child: ListRefreshWidget(
          isLoading: controller.isLoading,
          onRefresh: () async {
            controller.getServices();
          },
          customEmpty: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LottieBuilder.asset(
                  "assets/empty.json",
                ),
                const TextWidget(
                  "Sem fotos por enquanto",
                ),
              ],
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: controller.services.length,
          itemBuilder: (_, index) => ListTile(
            leading: TextWidget(
              "R\$ ${controller.services[index].price.value.toString()}",
              customWeight: FontWeight.w800,
              customFontsize: 16,
            ),
            title: TextWidget(
              controller.services[index].name,
              customWeight: FontWeight.w800,
              customFontsize: 16,
            ),
            subtitle: TextWidget(
              controller.services[index].description,
              customFontsize: 13,
            ),
            trailing: ButtonWidget(
              title: "Escolher",
              onTap: () {
                Get.toNamed("/bookingConfirmation",
                  arguments: {
                    "service": controller.services[index],
                    "establishmentId": widget.establishmentId
                  }
                );
              }
            ),
          ),
        )
      ),
    );
  }
}
