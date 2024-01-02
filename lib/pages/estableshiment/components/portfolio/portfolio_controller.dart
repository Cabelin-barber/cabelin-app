import 'package:cabelin_v2/models/picture_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'portfolio_controller.g.dart';

class PortfolioController = _PortfolioControllerBase with _$PortfolioController;

abstract class _PortfolioControllerBase with Store {
  final api = Api.dio;
  late String establishmentId;

  _PortfolioControllerBase({required this.establishmentId}) {
    getPortfolioPhotos(); 
  }

  String urlImage = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.X6-9dBY_jMvvulC67C1MxgHaHa%26pid%3DApi&f=1&ipt=69951b32b3fa69c52caf2752ca959341b3041b3c2065e4a6251ed4b029ac389b&ipo=images";

  @observable
  bool isLoading = false;
  
  @observable
  ObservableList<PictureModel> photos = ObservableList<PictureModel>();

  @action
  Future<void> getPortfolioPhotos() async {
    print(establishmentId);
    try {
      isLoading = true;
      Response response = await api.get("/establishments/$establishmentId/service-pictures?page=0&size=1");
      Future.delayed(const Duration(seconds: 3));
      photos.addAll([
        PictureModel(
          id: "1",
          name: "generic name",
          url: urlImage
        ),
        PictureModel(
          id: "1",
          name: "generic name",
          url: urlImage
        ),
        PictureModel(
          id: "1",
          name: "generic name",
          url: urlImage
        ),
        PictureModel(
          id: "2",
          name: "generic name",
          url: urlImage
        ),
        PictureModel(
          id: "2",
          name: "generic name",
          url: urlImage
        ),
        PictureModel(
          id: "2",
          name: "generic name",
          url: urlImage
        )
      ]);
      //photos.addAll(List.from(response.data['content'].map((model) => PictureModel.fromJson(model))));
    } catch (e) {
      print("ERRO!");
    } finally{
      isLoading = false;
    }
  }
}
