import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllEstablishmentServicesPage extends StatelessWidget {
  const AllEstablishmentServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 10),
        child: ListRefreshWidget(
          isLoading: false,
          itemBuilder: (_, __) => ListTile(
          leading: const TextWidget(
            "R\$ 10",
            customWeight: FontWeight.w800,
            customFontsize: 16,
          ),
          title: const TextWidget(
            "Corte Degradê",
            customWeight: FontWeight.w800,
            customFontsize: 16,
          ),
          subtitle: const TextWidget(
            "Corte maneiro",
            customFontsize: 13,
          ),
          trailing: ButtonWidget(
            title: "Escolher",
            onTap: () {
              context.pop();
            }
          ),
        ),
          itemCount: 10,
          onRefresh: () async {
        
          }
        ),
      ),
    );
  }
}