import 'package:cabelin_v2/models/estableshiment_model.dart';
import 'package:cabelin_v2/models/picture_model.dart';
import 'package:cabelin_v2/models/price_model.dart';
import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'service_offer_controller.g.dart';

class ServiceOfferController = _ServiceOfferControllerBase with _$ServiceOfferController;

abstract class _ServiceOfferControllerBase with Store {
  final api = Api.dio;
  late String establishmentId;

  _ServiceOfferControllerBase({required this.establishmentId}) {
    getServices(); 
  }

  @observable
  bool isLoading = false;
  
  @observable
  ObservableList<ServiceModel> services = ObservableList<ServiceModel>();

  @action
  Future<void> getServices() async {
    print(establishmentId);
    try {
      isLoading = true;
      Response response = await api.get("/establishments/$establishmentId/beauty-services?page=0&size=1");
      Future.delayed(const Duration(seconds: 3));
      services.addAll([
        ServiceModel(
          id: "1",
          name: "Corte Degradê",
          description: "Corte para ficar na moda",
          minutes: 30,
          price: PriceModel(value: 30),
          professionals: ProfessionalModel(
            id: "1",
            name: "José",
            profilePicture: PictureModel(
              id: "123",
              name: "profile_image",
              url: "https://imgs.search.brave.com/GP4bygYhWqZAFCm-4MdgqMF0EPfFRTi5KbWRjOYQGaY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9oYXBw/eS1wZXJzb24tcG9y/dHJhaXQtc21pbGlu/Zy13b21hbi10YW5u/ZWQtc2tpbi1jdXJs/eS1oYWlyLWhhcHB5/LXBlcnNvbi1wb3J0/cmFpdC1zbWlsaW5n/LXlvdW5nLWZyaWVu/ZGx5LXdvbWFuLTE5/NzUwMTE4NC5qcGc"
            )
          )
        ),
        ServiceModel(
          id: "2",
          name: "Coloração Fantasia",
          description: "Transforme seu cabelo com cores vibrantes",
          minutes: 60,
          price: PriceModel(value: 50),
          professionals: ProfessionalModel(
            id: "2",
            name: "Maria",
            profilePicture: PictureModel(
              id: "124",
              name: "profile_image",
              url: "https://imgs.search.brave.com/Vb4C_j84dn-FQalxLwn7EXS9hMknJlZrTFexYxppuPw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/MjI1NTYxODk2Mzkt/YjE1MGVkOWM0MzMw/P3E9ODAmdz0xMDAw/JmF1dG89Zm9ybWF0/JmZpdD1jcm9wJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4elpX/RnlZMmg4TVRCOGZI/Qmxjbk52Ym1GOFpX/NThNSHg4TUh4OGZE/QT0.jpeg"
            )
          )
        ),
        ServiceModel(
          id: "3",
          name: "Penteado Elegante",
          description: "Crie um visual sofisticado para eventos especiais",
          minutes: 45,
          price: PriceModel(value: 40),
          professionals: ProfessionalModel(
            id: "3",
            name: "Ana",
            profilePicture: PictureModel(
              id: "125",
              name: "profile_image",
              url: "https://imgs.search.brave.com/pfniv-7q7qekiQDdMIKXlfqquWow46QjwGIqsOaysiU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTIz/NDc4Mjg4L3Bob3Rv/L2hhbmRzb21lLXlv/dW5nLW1hbi1vbi13/aGl0ZS1iYWNrZ3Jv/dW5kLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1SUmlQQzZX/RldjRGNmX0pTUm9m/cW1xWjFPR0p4Z1hx/UHZ4dDJsRnlycF9j/PQ"
            )
          )
        )
      ]);
      //services.addAll(List.from(response.data['content'].map((model) => ServiceModel.fromJson(model))));
      isLoading = false;
    } catch (e) {
      //[TO-DO implementar Catch]
      print("ERRO!");
    } finally{
      isLoading = false;
    }
  }
}
