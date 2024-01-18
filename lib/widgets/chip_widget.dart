import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {

  String title;
  void Function() onTap;

  ChipWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextWidget(title),
      ),
    );
  }
}