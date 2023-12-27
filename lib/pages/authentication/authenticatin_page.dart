import 'package:cabelin_v2/pages/authentication/authentication_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/socialLogin/google.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({super.key});
  
  AuthenticationController authenticationController = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return Scaffold(
      body: Visibility(
        visible: !isLoggedIn,
        replacement: const Column(
          children: [TextWidget("Replace")],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                hintText: "Email",
                suffixIcon: const Icon(Icons.email_outlined),
              ),
              TextfieldWidget(
                hintText: "Senha",
                isPasswordField: true,
                margin: const EdgeInsets.symmetric(vertical: 16),
              ),
              TextButtonWidget(title: "Esqueci a minha senha", onTap: () {}),
              ButtonWidget(fullWidth: true, title: "Entrar", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
