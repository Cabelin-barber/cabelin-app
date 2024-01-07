import 'package:cabelin_v2/models/service_model.dart';
import 'package:mobx/mobx.dart';
part 'booking_confirmation_controller.g.dart';

class BookingConfirmationController = _BookingConfirmationControllerBase with _$BookingConfirmationController;

abstract class _BookingConfirmationControllerBase with Store {

  _BookingConfirmationControllerBase({required ServiceModel firstServicePicked}) {
    allServicesPicked.add(firstServicePicked);
  }

  ObservableList<ServiceModel> allServicesPicked = ObservableList<ServiceModel>();

  @observable
  int? currentTimeSelected;

  @action
  void addNewService(ServiceModel service) {
    print("#####");
    print(service.description);
    print("#####");
    allServicesPicked.add(service);
  }

  @action
  void setCurrentTimeSelected(int newTime) {
    currentTimeSelected = newTime;
  } 

  @observable
  DateTime currentSelectedDate = DateTime.now();

  @action
  void changeDate(DateTime newDate) {
    currentSelectedDate = newDate;
  }
}