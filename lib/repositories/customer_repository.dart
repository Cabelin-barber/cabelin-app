import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';

class CustomerRepository {
  final Dio _api = Api.dio;

  Future<List<BookingModel>> getAllBookings() async {
    String customerId = "0343a79f-86b4-463b-bb5c-a5ee816fea32";

    Response response = await _api.get("/appointment-booking/customers/$customerId");
    return List.from(response.data.map((model) => BookingModel.fromJson(model)));
  }
}