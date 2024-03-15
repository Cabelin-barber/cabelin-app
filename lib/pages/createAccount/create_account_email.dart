import 'package:cabelin_v2/pages/createAccount/create_account_controller.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateAccountEmail extends StatelessWidget {
  CreateAccountEmail({super.key, this.shouldGoToRoute});
  
  String? shouldGoToRoute;
  @override
  Widget build(BuildContext context) {
    PageViewController _pageViewController = GetIt.instance<PageViewController>();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final emailTextEditingController = TextEditingController();
    final phoneTextEditingController = TextEditingController();
    final nameTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
    

    var maskFormatter =  MaskTextInputFormatter(
      mask: '(##) #####-####', 
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
    );
    return GetBuilder(
      init: CreateAccountController(shouldGoToRoute: shouldGoToRoute),
      builder: (controller) => Scaffold(
        appBar: AppbarWidget(
          title: "Criação de conta",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(
                  "Seja bem-vindo ou vinda :)",
                  customFontsize: 22,
                  customWeight: FontWeight.w800,
                  margin: EdgeInsets.only(bottom: 16),
                ),
            
                TextfieldWidget(
                  label: "E-mail",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailTextEditingController,
                  validator: (value) {
                    if(value == null || value.isEmpty ) {
                      return "Campo obrigatório";
                    }
                    if(!value.contains("@")){
                      return "Email inválido";
                    }
                    return null;
                  },
                ),
            
                TextfieldWidget(
                  label: "Telefone",
                  controller: phoneTextEditingController,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  validator: (value) {
                    if(value == null || value.isEmpty ) {
                      return "Campo obrigatório";
                    }
                    if(maskFormatter.unmaskText(value).length < 11){
                      return "Número inválido";
                    }
                    return null;
                  },
                ),
                TextfieldWidget(
                  label: "Como devemos te chamar?",
                  controller: nameTextEditingController,
                  margin: const EdgeInsets.only(bottom: 16),
                  validator: (value) {
                    if(value == null || value.isEmpty ) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
      
                TextfieldWidget(
                  label: "Senha",
                  controller: passwordTextEditingController,
                  isPasswordField: true,
                  margin: const EdgeInsets.only(bottom: 16),
                  validator: (value) {
                    if(value == null || value.isEmpty ) {
                      return "Campo obrigatório";
                    }
                    if(value.length < 6) {
                      return "Senha muito fraca, deve ter pelo menos 6 digitos";
                    }
                    return null;
                  },
                ),
                ButtonWidget(
                  title: "Criar conta",
                  fullWidth: true,
                  onTap: () {
      
                    //GlobalContext.context.currentContext?.go("/");
                    if(_formKey.currentState!.validate()){
                      controller.createAccount(
                        name: nameTextEditingController.text,
                        email: emailTextEditingController.text,
                        phone: maskFormatter.unmaskText(phoneTextEditingController.text),
                        password: passwordTextEditingController.text
                      );
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