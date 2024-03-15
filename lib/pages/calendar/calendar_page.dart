import 'package:cabelin_v2/enums/enum_stauts_booking.dart';
import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/pages/bookingInformation/booking_information_page.dart';
import 'package:cabelin_v2/pages/calendar/calendar_controller.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/listable_refresh.dart';
import 'package:cabelin_v2/widgets/status_chip_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {

    String urlImage = "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";


    return GetBuilder(
      init: CalendarController(),
      builder: (controller) => Scaffold(
        body: LayoutWidget(
          child: ListableRefreshWidget(
            onLoadMore: (page) => controller.loadMoreBookings(page),
            onRefresh: controller.getAllBookings,
            itemCount: controller.bookings.length,
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
                          StatusChipWidget(status: StatusBooking.CLOSED),
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
                              child: TextWidget("${controller.formatDate(booking.date)}, ${booking.hourOfService.startHour}",
                                customWeight: FontWeight.w800
                              )
                            ),
                          )
                        ],
                      )
                    ),
                  );
                }
            )          
        ),
      ),
    );
  }
}