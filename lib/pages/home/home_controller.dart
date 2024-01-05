import 'package:cabelin_v2/localstorage/models/location_model.dart';
import 'package:cabelin_v2/localstorage/repositories/location_storage.repository.dart';
import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _api = Api.dio;
  final _userLocationStorageRepository = GetIt.I<UserLocationStorageRepository>();
  final scrollController = ScrollController();
  int _currentPage = 1;

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

  _HomeControllerBase() {
    currentLocation = _userLocationStorageRepository.getUserLocation();
    _userLocationStorageRepository.store.record("userLocation").onSnapshot(_userLocationStorageRepository.db).listen((event) {
      if(event?.value != null) {
        currentLocation = LocationModel.fromJson(event!.value as Map<String, dynamic>);
      }
    });

    getEstablishments();
    scrollController.addListener(infiniteScroll);
  }

  @action
  infiniteScroll() {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      loadMoreEstablishments();
    }
  }

  @action
  Future<void> getEstablishments() async {
    try {
      allEstablishments.clear();
      isLoadingEstablishment = true;
      isLoadingEstablishment = false;
      Response response = await _api.get("/establishments?page=0&size=1");
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    }
  }

  @action
  loadMoreEstablishments() async {
    try {
      Response response = await _api.get("/establishments?page=$_currentPage&size=1");
      allEstablishments.addAll(List.from(response.data['content'].map((model) => EstablishmentModel.fromJson(model))));
      _currentPage++;
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    }
  }
}