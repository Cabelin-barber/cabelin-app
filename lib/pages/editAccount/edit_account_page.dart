import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';


class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController(text: "Carlos Augusto");
    final emailController = TextEditingController(text: "carlos@gmail.com");

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget("Edição da conta"),
      ),
      body: LayoutWidget(
        child: Column(
          children: [
            TextfieldWidget(
              label: "Nome",
              controller: nameController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget("Email"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget("carlosaugusto@gmail.com"),
                      ButtonWidget(
                        title: "Alterar",
                        onTap: () {}
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget("Número para contato"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget("(62) 98239-9800"),
                      ButtonWidget(
                        title: "Alterar",
                        onTap: () {}
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            ButtonWidget(
              fullWidth: true,
              title: "Salvar",
              onTap: () {

              }
            )
          ],
        ),
      ),
    );  
  }
}