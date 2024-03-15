import 'package:cabelin_v2/models/service_model.dart';
import 'package:get/get.dart';
class BookingConfirmationController extends GetxController {

  BookingConfirmationController({required ServiceModel firstServicePicked}) {
    allServicesPicked.add(firstServicePicked);
    update();
  }

  List<ServiceModel> allServicesPicked = [];

  int? currentTimeSelected;

  void addNewService(ServiceModel service) {
    allServicesPicked.add(service);
  }

  void deleteService(int index) {
    allServicesPicked.removeAt(index);
  }

  void setCurrentTimeSelected(int newTime) {
    currentTimeSelected = newTime;
  } 

  DateTime currentSelectedDate = DateTime.now();

  void changeDate(DateTime newDate) {
    currentSelectedDate = newDate;
  }
}