import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ProfileController extends GetxController {

  UserStorageRepository userStorageRepository = GetIt.I<UserStorageRepository>();
 
  UserModel? currentUser;


  ProfileController() {
    currentUser = userStorageRepository.getUser()!;
  }
  
}