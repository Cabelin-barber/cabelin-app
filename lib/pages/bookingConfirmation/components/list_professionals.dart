import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation_controller.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProfessionals extends StatelessWidget {
  ListProfessionals({
    super.key,
    required this.professionals,
    required this.currentService
  });

  List<ProfessionalModel> professionals;
  ServiceModel currentService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Profissioanis disponíveis"),
      body: LayoutWidget(
        child: ListWidget(
          itemBuilder: (_, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(professionals[index].name),
              ButtonWidget(title: "Escolher", onTap: () {
                Get.find<BookingConfirmationController>().didChangeProfessional(
                  service: currentService,
                  professionalSelected: professionals[index]
                );
                Get.back();
              })
            ],
          ),
          itemCount: professionals.length
        ),
      ),
    );  
  }
}