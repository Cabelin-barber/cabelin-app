import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/pages/authentication/authentication_controller.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/socialLogin/google.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({super.key});
  
  AuthenticationController authenticationController = AuthenticationController();
  final _formKey = GlobalKey<FormState>();
  UserStorageRepository userStorageRepository = GetIt.instance<UserStorageRepository>();
  PageViewController pageViewController = GetIt.instance<PageViewController>();


  @override
  Widget build(BuildContext context) {

    UserModel? currentUser = userStorageRepository.getUser();
    bool isLoggedIn = false;
    return Scaffold(
      body: LayoutWidget(
        child: Visibility(
          visible: currentUser == null,
          replacement: Column(
            children: [
              TextWidget("Olá, ${currentUser?.name}")
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return GoogleLoginSocialWidget(
                    onTap: authenticationController.signInWithGoogle,
                    isLoading: authenticationController.isLoadingSingInGoogle
                  );
                }),
                const Center(
                  child: TextWidget("ou", margin: EdgeInsets.only(top: 16, bottom: 16),)
                ),
                TextfieldWidget(
                  label: "Email",
                  suffixIcon: const Icon(Icons.email_outlined),
                  validator: (String? value)  {
                    if(value ==  null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                TextfieldWidget(
                  label: "Senha",
                  isPasswordField: true,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  validator: (String? value)  {
                    if(value ==  null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                TextButtonWidget(title: "Esqueci a minha senha", onTap: () {}),
                ButtonWidget(
                  title: "Entrar",
                  fullWidth: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // [TO-DO]
                      // Implementar authenticaçaõ
                    }
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
