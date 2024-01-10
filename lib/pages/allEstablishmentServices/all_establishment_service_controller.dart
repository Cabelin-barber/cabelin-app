import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'all_establishment_service_controller.g.dart';

class AllEstablishmentServiceController = _AllEstablishmentServiceControllerBase with _$AllEstablishmentServiceController;

abstract class _AllEstablishmentServiceControllerBase with Store {
  final api = Api.dio;
  String establishmentId;

  ObservableList<ServiceModel> services = ObservableList<ServiceModel>();

  @observable
  bool isLoading = false;

  _AllEstablishmentServiceControllerBase({required this.establishmentId}) {
    getAllServices();
  }
  
  @action
  Future<void> getAllServices() async {
    try {
      services.clear();
      isLoading = true;
      Response response = await api.get("/establishments/$establishmentId/beauty-services?page=0&size=10");
      services.addAll(List.from(response.data['content'].map((model) => ServiceModel.fromJson(model))));
      isLoading = false;
    } catch (e) {
      //[TO-DO implementar Catch]
      print("ERRO!");
    } finally{
      isLoading = false;
    }    
  }
}