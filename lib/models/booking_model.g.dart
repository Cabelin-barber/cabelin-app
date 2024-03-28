// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as String,
      establishment: EstablishmentBookingModel.fromJson(
          json['establishment'] as Map<String, dynamic>),
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      status: $enumDecode(_$StatusBookingEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      hourOfService: HourOfServiceModel.fromJson(
          json['hourOfService'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'establishment': instance.establishment,
      'price': instance.price,
      'status': _$StatusBookingEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'hourOfService': instance.hourOfService,
    };

const _$StatusBookingEnumMap = {
  StatusBooking.OPEN: 'OPEN',
  StatusBooking.CLOSED: 'CLOSED',
  StatusBooking.CANCELED: 'CANCELED',
};
