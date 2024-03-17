import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
 
  UserModel? currentUser;


  ProfileController() {
    currentUser =  UserStorage.get();
  }
  
}