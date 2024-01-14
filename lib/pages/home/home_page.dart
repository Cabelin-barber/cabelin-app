import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            const TextWidget("Parece que você ainda não fez \n nenhum agendamento"),
            ButtonWidget(
              title: "Agendar agora",
              onTap: () {}
            )
          ],
        ),
      ),
    );
  }
}