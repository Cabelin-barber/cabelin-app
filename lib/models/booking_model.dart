import 'package:cabelin_v2/enums/enum_stauts_booking.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/models/establishment_booking_model.dart';
import 'package:cabelin_v2/models/hour_of_service_model.dart';
import 'package:cabelin_v2/models/price_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {

  String id;
  EstablishmentBookingModel establishment;
  PriceModel price;
  StatusBooking status;
  DateTime date;
  HourOfServiceModel hourOfService;

  BookingModel({
    required this.id,
    required this.establishment,
    required this.price,
    required this.status,
    required this.date,
    required this.hourOfService
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}