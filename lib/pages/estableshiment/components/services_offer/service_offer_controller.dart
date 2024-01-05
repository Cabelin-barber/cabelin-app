import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'service_offer_controller.g.dart';

class ServiceOfferController = _ServiceOfferControllerBase
    with _$ServiceOfferController;

abstract class _ServiceOfferControllerBase with Store {
  final api = Api.dio;
  late String establishmentId;

  _ServiceOfferControllerBase({required this.establishmentId}) {
    getServices();
  }

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ServiceModel> services = ObservableList<ServiceModel>();

  @action
  Future<void> getServices() async {
    try {
      services.clear();
      isLoading = true;
      Response response = await api.get("/establishments/$establishmentId/beauty-services?page=0&size=10");
      Future.delayed(const Duration(seconds: 3));

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
