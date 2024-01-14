import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EmailConfirmationPage extends StatelessWidget {
  const EmailConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController(text: "carlos@gmail.com");
    
    return Scaffold(
      appBar: AppbarWidget(title: "Confirmar email de contato"),
      body: LayoutWidget(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget("Qual o seu e-mail?"),
          
              TextfieldWidget(
                autofocus: true,
                label: "Email",
                margin: const EdgeInsets.only(top: 16),
                controller: emailController,
                validator: (String? value) {
                  if(value== null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  if(!value.contains("@")){
                    return "Email inválido";
                  }
                  return null;
                } ,
                hideKeyboardTapOutside: false,
              ),
              const Spacer(),
              ButtonWidget(
                title: "Confirmar",
                fullWidth: true,
                onTap: () {
                  if(formKey.currentState!.validate()){
                    print("Foi!");
                  }
                } 
              )
            ],
          ),
        )
      ),
    );
  }
}