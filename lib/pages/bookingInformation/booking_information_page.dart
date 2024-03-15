import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/utils/real_formatter.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/googleMap_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class BookingInformationPage extends StatelessWidget {
  BookingInformationPage({super.key, required this.booking});

  BookingModel booking;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          booking.establishment.name,
          customWeight: FontWeight.w800,
        ),
      ),
      body: Column(
        children: [
          const GoogleMapWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListWidget(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 10,
                itemBuilder: (_, __) => ListTile(
                  title: const TextWidget(
                    "{{nome do serviço}}",
                    customWeight: FontWeight.w800,
                  ),
                  subtitle: const TextWidget("{{nome do profissional}}"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        RealFormat.format(booking.price.value),
                        customWeight: FontWeight.w800,
                      ),
                      TextWidget(
                        "${booking.hourOfService.startHour} - ${booking.hourOfService.endHour}",
                        customFontsize: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  title: "Cancelar",
                  color: Colors.red,
                  onTap: () {}
                ),
                ButtonWidget(
                  title: "Alterar",
                  onTap: () {}
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}