import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ServicesOfferPage extends StatelessWidget {
  const ServicesOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListWidget(
      itemBuilder: (_, __) => TextWidget("Teste"),
      itemCount: 10
    );
  }
}