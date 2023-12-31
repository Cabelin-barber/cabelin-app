import 'dart:async';

import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/googleMap_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingInformationPage extends StatelessWidget {
  const BookingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final googleMapsController = Completer<GoogleMapController>();
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          "Salão da Patricia",
          customWeight: FontWeight.w800,
        ),
      ),
      body: Column(
        children: [
          const GoogleMapWidget(),
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