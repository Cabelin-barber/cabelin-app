import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/repositories/establishment_repository.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:get/get.dart';

class InformationsController extends GetxController {

  String establishmentId;
  final _establishmetRepisotory = Get.find<EstablishmentRepository>();
  EstablishmentModel? establishmentData;

  InformationsController(this.establishmentId) {
    getInfos();
  }

  getInfos() async {
    try {
      EstablishmentModel? establishment = await _establishmetRepisotory.getEstablishmentById(establishmentId);
      if(establishment != null) {
        establishmentData = establishment;
        update();
      }
    } catch (e) {
      FeedbackSnackbar.error("Por favor, tente novamente");
    }
  }
}