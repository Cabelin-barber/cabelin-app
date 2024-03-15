import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/pages/bookingInformation/booking_information_page.dart';
import 'package:cabelin_v2/pages/calendar/calendar_controller.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {

    String urlImage = "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";


    return GetBuilder(
      init: CalendarController(),
      builder: (controller) => Scaffold(
        body: LayoutWidget(
          child: CustomMaterialIndicator(
              indicatorBuilder: (context, controller) => const CupertinoActivityIndicator(),
              onRefresh: () => controller.getAllBookings(),
              child: ListWidget(
                itemCount: controller.bookings.length,
                isLoading: controller.isLoading,
                itemBuilder: (_, index) {
                  BookingModel booking = controller.bookings[index];
                  return GestureDetector(
                    onTap: () => Get.to(BookingInformationPage(booking: booking)),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        color: Colors.grey[100],
                      ),
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: const BorderRadius.all(Radius.circular(100))
                            ),
                            child: const TextWidget(
                              "Confirmado",
                              customFontsize: 13,
                              color: Colors.green,
                              customWeight: FontWeight.w800,
                            ),
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  urlImage,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              TextWidget(
                                booking.establishment.name,
                                customWeight: FontWeight.w800,
                                margin: const EdgeInsets.only(left: 16)
                              ),
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.chevron_right_rounded)
                                )
                              )
                            ],
                          ),
                          const Divider(),
                          const TextWidget("{{nome do serviço}}"),
                                
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(controller.formatDate(booking.date),
                                customWeight: FontWeight.w800
                              )
                            ),
                          )
                        ],
                      )
                    ),
                  );
                }
              ),
            )          
        ),
      ),
    );
  }
}