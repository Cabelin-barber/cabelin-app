import 'package:cabelin_v2/models/service_model.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListServices extends StatelessWidget {
  ListServices({super.key, required this.services, required this.onDeleteService});
  List<ServiceModel> services;
  Function(int index) onDeleteService;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListWidget(
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        itemBuilder: (_, index) => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey.withOpacity(0.3),
                ),
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          services[index].name,
                          customWeight: FontWeight.w800,
                          customFontsize: 16,
                        ),
                        TextWidget(
                          "R\$ ${services[index].price.value.toString()}",
                          customWeight: FontWeight.w800,
                          customFontsize: 16,
                        ),
                      ],
                    ),
                    const Divider(),
                    services[index].professionals.length == 1
                        ? TextWidget(
                            "Profissional: ${services[index].professionals[0].name}",
                            color: Colors.grey[700],
                          )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget("Mais de um profissional"),
                            GestureDetector(
                              child: const Icon(Icons.chevron_right_rounded),
                            )
                          ],
                        )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: services.length == 1 ? false : true,
              child: Align(
                alignment: Alignment.centerRight,
                child: Positioned.fill(
                  child: GestureDetector(
                    onTap: () => onDeleteService(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                        borderRadius: BorderRadius.circular(50)
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
