import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:get/get.dart';

class ServiceOfferController extends GetxController {
  final api = Api.dio;
  late String establishmentId;

  ServiceOfferController({required this.establishmentId}) {
    getServices();
  }

  bool isLoading = false;

  List<ServiceModel> services = [];

  Future<void> getServices() async {
    try {
      services.clear();
      isLoading = true;
      var response = await api.get("/establishments/$establishmentId/beauty-services?page=0&size=10");
      print(response.data);
      services.addAll(List.from(response.data['content'].map((model) => ServiceModel.fromJson(model))));
      isLoading = false;
      update();
    } catch (e) {
      print(e);
            //[TO-DO implementar Catch]
      print("ERRO!");
    } finally{
      isLoading = false;
      update();
    }
  }
}
