import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {

  @observable
  bool isLoadingSingInGoogle = false;

  @action
  Future<void> signInWithGoogle() async {
  isLoadingSingInGoogle = true;
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
    print(user.user?.displayName);
    print(user.user?.email);
  } catch (e) {
      print(e);
  } finally{
      isLoadingSingInGoogle = false;
    }
  }
}