import 'package:cabelin_v2/enums/enums_provider_account.dart';
import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/utils/apiRequest.dart';
import 'package:cabelin_v2/utils/feedback_snackbar.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:cabelin_v2/utils/loading_fullscreen.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountControllerBase with _$CreateAccountController;

abstract class _CreateAccountControllerBase with Store {
  
  Dio _api = Api.dio;
  final String? _shouldGoToRoute;
  PageViewController _pageViewController = GetIt.instance<PageViewController>();
  UserStorageRepository userStorageRepository = GetIt.instance<UserStorageRepository>();

  _CreateAccountControllerBase({required shouldGoToRoute}) : _shouldGoToRoute = shouldGoToRoute;

  Future<void> createAccount({
    required String name,
    required String email,
    required String phone,
    required String password
  }) async {
    var brazilianPhone = "+55$phone";
    LoadingFullscreen.startLoading();
    try {
      Response result = await _api.post("/customers", data: {
        "name": name,
        "email": email,
        "password": password,
        "notificationToken": await FirebaseMessaging.instance.getToken(),
        "provider": "APPLICATION",
        "verificationAccountType": "EMAIL_VERIFICATION",
        "phone": {
          "number": brazilianPhone,
          "isMobile": true
        },
      });

      UserModel user = UserModel.fromJson(result.data);
      await saveUserInLocal(user);
      if(_shouldGoToRoute != null){
        FeedbackSnackbar.success("Conta criada com sucesso!");
        return GlobalContext.context.currentContext?.go(_shouldGoToRoute);
      }
      LoadingFullscreen.stopLoading();
      _pageViewController.pageController.jumpToPage(0);
      GlobalContext.context.currentContext?.go("/");
      FeedbackSnackbar.success("Conta criada com sucesso!");
    } catch (e) {
      FeedbackSnackbar.error("Erro ao criar sua conta, tente novamente");
    }
  }

  Future<void> saveUserInLocal(UserModel user) async {
    await userStorageRepository.saveUser(user);

  }
}