import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {

  UserStorageRepository userStorageRepository = GetIt.I<UserStorageRepository>();
 
  @observable
  UserModel? currentUser;


  _ProfileControllerBase() {
    currentUser = userStorageRepository.getUser()!;
  }
  
}