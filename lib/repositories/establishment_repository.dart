import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';

class EstablishmentRepository {
  final Dio _api = Api.dio;

  Future<EstablishmentModel?> getEstablishmentById(String id) async {
    var response = await _api.get("/establishments/$id");
    if(response.data == null) {
      return null;
    }
    return EstablishmentModel.fromJson(response.data);
  }

  Future<List<String>> getAvailableHoursService(String establishmentId, String professionalId, String serviceId,) async {
    //var response = await _api.get("/establishments/$establishmentId/beauty-services/$serviceId/available-hours?date=2024-03-20");
    var response = await _api.get("/establishments/$establishmentId/professionals/$professionalId/beauty-services/$serviceId/available-hours?date=2024-04-01");
    return List<String>.from(response.data);
  }

  Future<List<ProfessionalModel>> getProfessionals({required String establishemntId, required String serviceId}) async {
    var response = await _api.get("/establishments/$establishemntId/professionals");
    return List.from(response.data.map((model) => ProfessionalModel.fromJson(model)));
  }

  Future<void> createBooking(String establishmentId, String professionalId, String serviceId, String hourOfService, String date) async {
    var currentUser = UserStorage.get();
    await _api.post("/appointment-booking/users/${currentUser?.id}/establishments/$establishmentId", data: [
        {
          "professional": {
            "id": professionalId
          },
          "beautyService": {
            "id": serviceId
          },
          "hourOfService": {
            "startHour": hourOfService
          },
          "date": date
        }
      ]
    );
  }
}