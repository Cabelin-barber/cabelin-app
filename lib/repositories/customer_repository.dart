import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/models/booking_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';

class CustomerRepository {
  final Dio _api = Api.dio;

  Future<List<BookingModel>> getAllBookings() async {
    UserModel? currentUser = UserStorage.get();
    String customerId = "f98069c8-4fff-494f-9bef-e908faea4bb3";
    if(currentUser == null) {
      return [];
    }

    //Response response = await _api.get("/appointment-booking/customers/${currentUser?.id}");
    Response response = await _api.get("/appointment-booking/customers/${customerId}");
    return List.from(response.data.map((model) => BookingModel.fromJson(model)));
  }
}