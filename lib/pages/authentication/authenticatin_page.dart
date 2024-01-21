import 'package:cabelin_v2/localstorage/models/user_model.dart';
import 'package:cabelin_v2/localstorage/repositories/user_storage_repository.dart';
import 'package:cabelin_v2/pages/authentication/authentication_controller.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/pages/profile/profile_page.dart';
import 'package:cabelin_v2/utils/alert_custom.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/socialLogin/google.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AuthenticationPage extends StatelessWidget {
  
  AuthenticationPage({super.key, this.shouldComeBack = false});
  final _formKey = GlobalKey<FormState>();
  final _formFieldKey = GlobalKey<FormFieldState>();
  UserStorageRepository userStorageRepository = GetIt.instance<UserStorageRepository>();
  PageViewController pageViewController = GetIt.instance<PageViewController>();
  bool shouldComeBack;

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = AuthenticationController(shouldComeBack: shouldComeBack);
    UserModel? currentUser = userStorageRepository.getUser();

    return Scaffold(
      appBar: AppbarWidget(),
      body: LayoutWidget(
        child: Visibility(
          visible: currentUser == null,
          replacement: const ProfilePage(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(title: "Login provisorio", onTap: () {
                  authenticationController.loginProvisorio();
                }),
                Observer(builder: (_) {
                  return GoogleLoginSocialWidget(
                    onTap: authenticationController.signInWithGoogle,
                    isLoading: authenticationController.isLoadingSingInGoogle
                  );
                }),
                const Center(
                  child: TextWidget("ou", margin: EdgeInsets.only(top: 16, bottom: 16),)
                ),
                TextFormField(
                  key: _formFieldKey,
                  decoration: const InputDecoration(
                    labelText: "Email"
                  ),
                  validator: (String? value)  {
                    if(value ==  null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    if(!value.contains("@")) {
                      return "Email inválido";
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
                TextButtonWidget(title: "Esqueci a minha senha", onTap: () {
                  if(_formFieldKey.currentState!.validate()) {
                    CustomAlert.alert(
                      title: "Instruções enviadas",
                      description: "Enviamos as intruções de mudança \n de senha para \n ${_formFieldKey.currentState?.value}.\n Verique sua caixa de entrada \n e de spam"
                    );
                  }
                }),
                TextButtonWidget(
                  title: "Criar conta",
                  onTap: () {
                    context.push("/createAccount");
                  }
                ),
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
