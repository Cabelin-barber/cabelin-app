import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Informations extends StatelessWidget {
  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget("Barbearia com mais 10 de anos de tradição sempre pensando no bem estar do cliente"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                "(62) 98239-8342",
                margin: EdgeInsets.only(bottom: 16, top: 16)
              ),
              ButtonWidget(
                title: "Ligar",
                onTap: () async {
                  final call = Uri.parse("tel:62982399800");
                  if (await canLaunchUrl(call)) {
                    launchUrl(call);
                  } else {
                    throw 'Could not launch $call';
                  }
                }
              )
            ],
          ),
          const Divider(),
          const TextWidget(
            "Horários",
            customFontsize: 22,
            customWeight: FontWeight.w800,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, __) => const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget("Segunda-feira"),
                TextWidget("8:00 - 16:00", customWeight: FontWeight.w800)
              ],
            ),
            itemCount: 10
          ),
      
        ],
      ),
    );
  }
}