import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/booking_confirmation_controller.dart';
import 'package:cabelin_v2/pages/bookingConfirmation/components/list_professionals.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListServices extends StatelessWidget {
  ListServices({super.key, required this.services, required this.onDeleteService});
  List<ServiceModel> services;
  Function(int index) onDeleteService;

  @override
  Widget build(BuildContext context) {
    return ListWidget(
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (_, index) => Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.withOpacity(0.3),
              ),
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        services[index].name,
                        customWeight: FontWeight.w800,
                        customFontsize: 16,
                      ),
                      TextWidget(
                        "R\$ ${services[index].price.value.toString()}",
                        customWeight: FontWeight.w800,
                        customFontsize: 16,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "Profissional: ${services[index].professionals[0].name}",
                        color: Colors.grey[700],
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right_rounded),
                        onPressed: () async {
                          var professionals = await Get.find<BookingConfirmationController>().getAvailableProfessionals(serviceId: services[index].id);
                          Get.to(() => ListProfessionals(
                            professionals: professionals,
                            currentService: services[index],
                          )
                          );
                        }
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: services.length == 1 ? false : true,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => onDeleteService(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(50)
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
