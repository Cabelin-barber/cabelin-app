import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/repositories/establishment_repository.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:get/get.dart';
class BookingConfirmationController extends GetxController {

  BookingConfirmationController({
    required ServiceModel firstServicePicked,
    required this.establishmentId
  }) {
    allServicesPicked.add(firstServicePicked);
    update();
  }

  List<ServiceModel> allServicesPicked = [];
  List<String> availableHoursService = [];

  int? currentTimeSelected;
  final establishmentRepository = Get.find<EstablishmentRepository>();
  String establishmentId;

  void didAddNewService(ServiceModel service) {
    allServicesPicked.add(service);
    update();
  }

  void deleteService(int index) {
    allServicesPicked.removeAt(index);
    update();
  }

  void setCurrentTimeSelected(int newTime) {
    currentTimeSelected = newTime;
    update();
  } 

  DateTime currentSelectedDate = DateTime.now();

  void changeDate(DateTime newDate) {
    currentSelectedDate = newDate;
    update();
  }

  Future<void> checkAvailableHours() async {
    for(var currentService in allServicesPicked) {
      var res = await establishmentRepository.getAvailableHoursService(establishmentId, "52bcb561-5e0e-4138-9486-1f579c8967fd", currentService.id);
      availableHoursService.addAll(res);
      update();
    }
  }

  Future<void> finishBooking() async {
    try {
      for(var currentService in allServicesPicked) {
        await establishmentRepository.createBooking(
          establishmentId,
          allServicesPicked.first.professionals.first.id,
          currentService.id,
          "17:00",
          "2024-03-27"
        );
      }
      FeedbackSnackbar.success("Sucesso!");
    } catch (e) {
     FeedbackSnackbar.error("Opps..."); 
    }
  }
}