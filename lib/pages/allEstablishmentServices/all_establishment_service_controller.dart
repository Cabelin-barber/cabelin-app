import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllEstablishmentServiceController extends GetxController {
  final api = Api.dio;
  String establishmentId;

  List<ServiceModel> services = [];
  bool isLoading = false;

  AllEstablishmentServiceController({required this.establishmentId}) {
    getAllServices();
  }
  
  Future<void> getAllServices() async {
    try {
      services.clear();
      isLoading = true;
      var response = await api.get("/establishments/$establishmentId/beauty-services?page=0&size=10");
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