import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Informations extends StatelessWidget {
  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget("(62) 98239-8342", margin: EdgeInsets.only(bottom: 16, top: 16)),
        const TextWidget("Horários", customFontsize: 22),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) => const TextWidget("Segunda 8:00 - 16:00", customFontsize: 16),
          itemCount: 10
        ),

      ],
    );
  }
}