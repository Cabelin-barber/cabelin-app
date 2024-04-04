import 'package:cabelin_v2/models/professional_model.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableRoundedList extends StatelessWidget {
  SelectableRoundedList({super.key, required this.professionals});

  bool isSelected = false;
  List<ProfessionalModel> professionals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          ProfessionalModel professional = professionals[index];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(2), // Border width
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(30), // Image radius
                    child: Image.network("https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", fit: BoxFit.cover),
                  ),
                ),
              ),
              TextWidget(professional.name)
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: professionals.length
      ),
    );
  }
}