import 'package:cabelin_v2/pages/home/components/location/location_page.dart';
import 'package:cabelin_v2/pages/home/home_controller.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    String urlImage = "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (contenxt) => TextButtonWidget(
            icon: Icons.expand_more_rounded,
            title: homeController.currentLocation == null
              ? "Buscar pela minha localização"
              : homeController.currentLocation!.city,
            onTap: () {
              showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                builder: (context) => const LocationPage()
              );
            }
          ),
        ),
      ),
      body: CustomMaterialIndicator(
        withRotation: false,
        indicatorBuilder: (context, controller) => const CupertinoActivityIndicator(),
        onRefresh: () async {
          homeController.getEstablishments();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Skeletonizer(
                    enabled: homeController.isLoadingEstablishment,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        margin: const EdgeInsets.symmetric(vertical: 22),
                        decoration: const BoxDecoration(
                            color: Color(0XFFF8EDFF),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Stack(
                          children: [
                            Image.network(
                              "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              bottom: 10,
                              child: TextWidget(
                                "Seja vaidosa com \nos melhores",
                                color: Colors.white,
                                customWeight: FontWeight.w800,
                                margin: EdgeInsets.only(left: 16),
                              ),
                            )
                          ],
                        )),
                  );
                }),
                Observer(builder: (_) {
                  return Skeletonizer(
                    enabled: homeController.isLoadingEstablishment,
                    child: const TextWidget(
                      "Agendamentos marcados",
                      customFontsize: 20,
                      customWeight: FontWeight.w800,
                      margin: EdgeInsets.only(bottom: 16),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Skeletonizer(
                    enabled: homeController.isLoadingEstablishment,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(12)),
                        color: Colors.grey[300]
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget("Dia 15, segunda-feira"),
                          TextWidget("Salão do Marquinhos"),
                          TextWidget("- Barba"),
                          TextWidget("- Corte Degradê")
                        ],
                      ),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Skeletonizer(
                    enabled: homeController.isLoadingEstablishment,
                    child: const TextWidget(
                      "Salões abertos hoje",
                      customFontsize: 20,
                      customWeight: FontWeight.w800,
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Skeletonizer(
                    enabled: homeController.isLoadingEstablishment,
                    child: SizedBox(
                      height: 300,
                      child: ListWidget(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => context.push(
                            "/estableshiment/${homeController.todayEstablishments[index].id}"
                          ),
                          child: Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                color: Color(0XFFF8EDFF),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    urlImage,
                                    height: 240,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TextWidget(
                                          "William Barbeiro",
                                          customFontsize: 20,
                                          customWeight: FontWeight.w800,
                                        ),
                                        TextWidget(
                                            "1,6 km - Av Rochedo Quadra 28",
                                            color: Colors.grey[700])
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  );
                }),
                const TextWidget("Todos os salões",
                  customWeight: FontWeight.w800,
                  customFontsize: 20,
                  margin: EdgeInsets.symmetric(vertical: 16)
                ),

                Observer(
                  builder: (contenxt) => ListWidget(
                  itemCount: homeController.allEstablishments.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => context.push(
                      "/estableshiment/${homeController.allEstablishments[index].id}"
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(urlImage),
                        TextWidget(
                          homeController.allEstablishments[index].name,
                          customFontsize: 20,
                          customWeight: FontWeight.w800,
                        ),
                        TextWidget(
                          homeController.allEstablishments[index].address.city,
                          color: Colors.grey[700]
                        )
                      ]),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
