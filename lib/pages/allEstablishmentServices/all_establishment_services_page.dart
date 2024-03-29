import 'package:cabelin_v2/pages/allEstablishmentServices/all_establishment_service_controller.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllEstablishmentServicesPage extends StatelessWidget {
  AllEstablishmentServicesPage({super.key, required this.establishemntId});
  String establishemntId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AllEstablishmentServiceController(establishmentId: establishemntId),
      builder: (controller) => Scaffold(
        appBar: AppbarWidget(title: "Todos os cortes"),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 10),
          child: ListRefreshWidget(
            itemCount: controller.services.length,
            onRefresh: () async {
              controller.getAllServices();
            },
            isLoading: controller.isLoading,
            itemBuilder: (_, index) => ListTile(
              leading: TextWidget(
                "R\$ ${controller.services[index].price.currency}",
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
                  controller.selectSevice(controller.services[index]);
                  Get.back();
                }
              ),
            )
          ),
        ),
      ),
    );
  }
}
