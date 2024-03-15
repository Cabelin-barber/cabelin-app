import 'package:cabelin_v2/models/picture_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:get/get.dart';
class PortfolioController extends GetxController {
  final api = Api.dio;
  late String establishmentId;

  PortfolioController({required this.establishmentId}) {
    getPortfolioPhotos(); 
  }

  String urlImage = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.X6-9dBY_jMvvulC67C1MxgHaHa%26pid%3DApi&f=1&ipt=69951b32b3fa69c52caf2752ca959341b3041b3c2065e4a6251ed4b029ac389b&ipo=images";

  bool isLoading = false;
  
  List<PictureModel> photos = [];

  Future<void> getPortfolioPhotos() async {
    try {
      isLoading = true;
      var response = await api.get("/establishments/$establishmentId/service-pictures?page=0&size=10");
      photos.addAll(List.from(response.data['content'].map((model) => PictureModel.fromJson(model))));
    } catch (e) {
      FeedbackSnackbar.error("Algo aconteceu, tente novamente");
    } finally{
      isLoading = false;
      update();
    }
  }
}
