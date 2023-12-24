import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;

    return Scaffold(
      body: Visibility(
        visible: !isLoggedIn,
        replacement: const Column(
          children: [
            TextWidget("Replace")
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                hintText: "Email",
                suffixIcon: const Icon(Icons.email_outlined),
              ),
              TextfieldWidget(
                hintText: "Senha",
                isPasswordField: true,
                margin: const EdgeInsets.symmetric(vertical: 16),
              ),
              TextButtonWidget(
                title: "Esqueci a minha senha",
                onTap: (){}
              ),
              
              ButtonWidget(
                fullWidth: true,
                title: "Entrar",
                onTap: () {}
              )
            ],
          ),
        ),
      ),
    );
  }
}