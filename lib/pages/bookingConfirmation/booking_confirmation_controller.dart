import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/repositories/establishment_repository.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class BookingConfirmationController extends GetxController {

  BookingConfirmationController({
    required this.firstServicePicked,
    required this.establishmentId
  }) {
    getProfessionals();
    allServicesPicked.add(firstServicePicked);
    update();
  }

  ServiceModel firstServicePicked;
  List<ServiceModel> allServicesPicked = [];
  List<String> availableHoursService = [];
  List<ProfessionalModel> professionals = [];

  int? currentTimeSelected;
  final establishmentRepository = Get.find<EstablishmentRepository>();
  String establishmentId;


  Future<List<ProfessionalModel>> getAvailableProfessionals({required String serviceId}) async {
    List<ProfessionalModel> availableProfessionals = await establishmentRepository.getAvailableProfessionals(
      establishmentId: establishmentId,
      serviceId: serviceId,
      date: "2024-04-05",
      startHour: "13:00"
    );
    return availableProfessionals;
  }

  void didAddNewService(ServiceModel service) async {
    List<ProfessionalModel> availableProfessionals = await getAvailableProfessionals(serviceId: service.id);
    service.professionals = availableProfessionals;
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

  Future<void> getProfessionals() async {
    try {
      var res = await establishmentRepository.getProfessionals(establishemntId: establishmentId, serviceId: firstServicePicked.id);
      professionals.addAll(res);
      update();
    } catch (e) {
      print(e);
      FeedbackSnackbar.error("Erro ao buscar os profissionais."); 
    }
  }

  Future<void> finishBooking() async {
    String horaFinal = "17:00"; //DateFormat('HH:mm').format(horaFinalDateTime);
    try {
      for (var i = 0; i < allServicesPicked.length; i++) {
        var currentService = allServicesPicked[i]; 

        int minutosParaAdicionar = currentService.minutes;

        //DateTime horaInicialDateTime = DateFormat('HH:mm').parse(horaInicial);
        DateTime horaFinalDateTime = DateFormat('HH:mm').parse(horaFinal).add(Duration(minutes: minutosParaAdicionar));
        horaFinal = DateFormat('HH:mm').format(horaFinalDateTime);
        
        print(horaFinal);
        //i++;
        // return;
        // //if(i != 0) {
        //   await establishmentRepository.createBooking(
        //     establishmentId,
        //     allServicesPicked.first.professionals.first.id,
        //     currentService.id,
        //     i != 0 ? horaFinal : "17:00",
        //     "2024-04-02"
        //   );
        // //}
      }
      FeedbackSnackbar.success("Sucesso!");
    } catch (e) {
     FeedbackSnackbar.error("Opps..."); 
    }
  }
}