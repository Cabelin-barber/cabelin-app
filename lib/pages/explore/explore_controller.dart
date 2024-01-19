import 'package:cabelin_v2/events/user_location_changed_event.dart';
import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/main.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';
part 'explore_controller.g.dart';

class ExploreController = _ExploreControllerBase with _$ExploreController;

abstract class _ExploreControllerBase with Store {
  final _api = Api.dio;
  final _userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();
  final scrollController = ScrollController();
  int _currentPage = 0;
  final nameEstablishmentController = TextEditingController();

  @observable
  bool isLoadingMore = false;

  @observable
  LocationModel? currentLocation;

  @observable
  bool isLoadingEstablishment = false;

  @observable
  ObservableList<EstablishmentModel> allEstablishments = ObservableList<EstablishmentModel>();

  @observable
  ObservableList<EstablishmentModel> todayEstablishments = ObservableList<EstablishmentModel>();

  _ExploreControllerBase() {
    currentLocation = _userLocationStorageRepository.getUserLocation();
    _userLocationStorageRepository.store.record("userLocation").onSnapshot(_userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });

    getEstablishments();
    scrollController.addListener(infiniteScroll);

    eventBus.on<UserLocationChangedEvent>().listen((event) {
      _currentPage = 0;
      getEstablishments();
    });
  }

  @action
  infiniteScroll() {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      //loadMoreEstablishments();
    }
  }

  @action
  Future<void> getEstablishments() async {

    Map<String, String?> params = {
      "city": currentLocation?.city,
      "page": _currentPage.toString(),
      "size": "1"
    };

    params.removeWhere((_, value) => value == null);

    print(params);

    try {
      allEstablishments.clear();
      isLoadingEstablishment = true;
      Response response = await _api.get(
        "/establishments", 
        queryParameters: params
      );
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage = 1;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      isLoadingEstablishment = false;
    }
  }

  @action
  loadMoreEstablishments() async {
    Map<String, String?> params = {
      "city": currentLocation?.city,
      "page": _currentPage.toString(),
      "size": "1"
    };

    params.removeWhere((_, value) => value == null);

    try {
      Response response = await _api.get("/establishments", queryParameters: params);
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage++;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    }
  }

  @action
  searchEstablishmentByName(String? value) async {
    allEstablishments.clear();
    LoadingFullscreen.startLoading();
    Map<String, String?> params = {
      //"city": currentLocation?.city,
      //"page": _currentPage.toString(),
      //"size": "1",
      "name": value
    };

    params.removeWhere((_, value) => value == null);

    try {
      Response response = await _api.get("/establishments", queryParameters: params);
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage++;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally {
      LoadingFullscreen.stopLoading();
    }
  }
}