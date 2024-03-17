import 'package:cabelin_v2/pages/estableshiment/components/informations/informations.dart';
import 'package:cabelin_v2/pages/estableshiment/components/portfolio/portfolio.dart';
import 'package:cabelin_v2/pages/estableshiment/components/services_offer/services_offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstlableshimentPage extends StatelessWidget {
  
  EstlableshimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    String urlImage = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.5323gYZjoqFwr0zrN28KPAHaE8%26pid%3DApi&f=1&ipt=96d6cb3c800087f979dcfed334aaa919f198619cfcf66cec8e9bfe1f65920957&ipo=images";

    String establishmentId = Get.arguments;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(urlImage),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: const Offset(0, 3)
                        ),
                      ],
                    ),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        size: 42,
                        color: Colors.white,
                      )
                    ),
                  ),
                ],
              ),
            const TabBar(
              labelColor: Colors.black87,
              labelStyle: TextStyle(fontFamily: "Sora"),
              unselectedLabelStyle: TextStyle(fontFamily: "Sora"),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Serviços"),
                Tab(text: "Portfólio"),
                Tab(text: "Informações"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ServicesOfferPage(establishmentId: establishmentId),
                  Portfolio(establishmentId: establishmentId),
                  Informations(establishmentId: establishmentId)
                ]
              ),
            ),
          ],
                ),
        )),
    );
  }
}