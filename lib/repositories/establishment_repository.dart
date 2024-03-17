import 'package:cabelin_v2/models/estableshiment_model.dart';
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
}