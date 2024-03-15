import 'package:cabelin_v2/enums/enum_stauts_booking.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class StatusChipWidget extends StatelessWidget {
  
  StatusChipWidget({super.key, required this.status});
  StatusBooking status;
  

  Color _getColorForStatus() {
    switch (status) {
      case StatusBooking.OPEN:
        return Colors.green.withOpacity(0.2);
      case StatusBooking.CLOSED:
        return Colors.blue.withOpacity(0.2);
      case StatusBooking.CANCELED:
        return Colors.red.withOpacity(0.2);
      }
  }

  String _getTextForStatus() {
    switch (status) {
      case StatusBooking.OPEN:
        return "Confirmado";
      case StatusBooking.CLOSED:
        return "Finalizado";
      case StatusBooking.CANCELED:
        return "Cancelado";
      }
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: _getColorForStatus(),
        borderRadius: const BorderRadius.all(Radius.circular(100))
      ),
      child: TextWidget(
        _getTextForStatus(),
        customFontsize: 13,
        color: _getColorForStatus(),
        customWeight: FontWeight.w800,
      ),
    );
  }
}