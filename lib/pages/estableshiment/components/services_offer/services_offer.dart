import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ServicesOfferPage extends StatelessWidget {
  const ServicesOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ListView.separated(
      separatorBuilder: (_, __) => const Divider(),
      itemCount: 2,
      padding: EdgeInsets.zero,
      itemBuilder: (_, __) => ListTile(
        leading: const TextWidget(
          "R\$ 35",
          customWeight: FontWeight.w800,
          customFontsize: 16,
        ),
        title: const TextWidget(
          "Corte degradê",
          customWeight: FontWeight.w800,
          customFontsize: 16,
        ),
        subtitle: const TextWidget(
          "Na Regua",
          customFontsize: 13,
        ),
        trailing: ButtonWidget(
          title: "Escolher",
          onTap: () {}
        ),
      ),
    ));
  }
}
