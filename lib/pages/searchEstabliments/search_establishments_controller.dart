import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'search_establishments_controller.g.dart';

class SearchEstablishmentsController = _SearchEstablishmentsControllerBase with _$SearchEstablishmentsController;

abstract class _SearchEstablishmentsControllerBase with Store {
  final Dio _api = Api.dio;

  @observable
  LocationModel? currentLocation;

  int _currentPage = 0;
  
  @observable
  ObservableList<EstablishmentModel> allEstablishments = ObservableList<EstablishmentModel>();
  
  _SearchEstablishmentsControllerBase() {
    _getEstablishments();
  }

  @action
  Future<void> _getEstablishments() async {

    Map<String, String?> params = {
      "city": currentLocation?.city,
      "page": _currentPage.toString(),
      "size": "1"
    };

    params.removeWhere((_, value) => value == null);

    try {
      allEstablishments.clear();
      //isLoadingEstablishment = true;
      Response response = await _api.get(
        "/establishments", 
        queryParameters: params
      );
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage = 1;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      //isLoadingEstablishment = false;
    }
  }
}