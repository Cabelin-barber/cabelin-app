import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.blue,
              ),
          
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(18),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget("Parece que você ainda não fez \n nenhum agendamento"),
                    ButtonWidget(
                      title: "Agendar agora",
                      onTap: () {}
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}