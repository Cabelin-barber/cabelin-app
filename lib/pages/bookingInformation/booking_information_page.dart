import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookingInformationPage extends StatelessWidget {
  const BookingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          "Salão da Patricia",
          customWeight: FontWeight.w800,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: Colors.blue,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListWidget(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 10,
                itemBuilder: (_, __) => const ListTile(
                  title: TextWidget(
                    "Pintar as unhas",
                    customWeight: FontWeight.w800,
                  ),
                  subtitle: TextWidget("Patricia"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        "R\$ 30",
                        customWeight: FontWeight.w800,
                      ),
                      TextWidget(
                        "13:00 - 14:00",
                        customFontsize: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  title: "Cancelar",
                  color: Colors.red,
                  onTap: () {}
                ),
                ButtonWidget(
                  title: "Alterar",
                  onTap: () {}
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}