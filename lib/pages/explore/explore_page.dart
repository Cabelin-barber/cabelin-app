import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/pages/explore/explore_controller.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_page.dart';
import 'package:cabelin_v2/widgets/listable_refresh.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    String urlImage = "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return GetBuilder(
      init: ExploreController(),
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.teal[900],
                pinned: false,
                snap: true,
                floating: true,
                centerTitle: true,
                title: TextButtonWidget(
                      color: Colors.white,
                      icon: const Icon(Icons.expand_more_rounded, color: Colors.white),
                      title: controller.currentLocation == null
                          ? "Buscar pela minha localização"
                          : controller.currentLocation!.city,
                      onTap: () {
                        showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => LocationPage());
                      }),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(60.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              String? search = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SearchEstablishmentsPage(
                                        currentSearch: controller
                                            .nameEstablishmentController.text),
                                  ));
                              if (search != null && search.isNotEmpty) {
                                controller.nameEstablishmentController.text = search;
                                controller.searchEstablishmentByName(search);
                              } else {
                                controller.nameEstablishmentController.clear();
                              }
                            },
                            child: TextfieldWidget(
                              hintText: "Nome do local",
                              controller: controller.nameEstablishmentController,
                              enabled: false,
                            ),
                          ),
                        ],
                      ),
                    ))),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverFillRemaining(
                  child: ListableRefreshWidget(
                      customEmpty: const Center(
                        child: TextWidget(
                          "Não encontramos nenhum \n estabelecimento na sua cidade :(",
                          textAlign: TextAlign.center
                        ),
                      ),
                      onLoadMore: controller.loadMoreEstablishments,
                      onRefresh: controller.getEstablishments,
                      itemCount: controller.allEstablishments.length,
                      items: controller.allEstablishments,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Get.toNamed(
                          "/estableshiment",
                          arguments: controller.allEstablishments[index].id
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(urlImage),
                              TextWidget(
                                controller.allEstablishments[index].name,
                                customFontsize: 20,
                                customWeight: FontWeight.w800,
                              ),
                              TextWidget(
                                controller.allEstablishments[index].address.city,
                                color: Colors.grey[700]
                              )
                            ]
                         ),
                       ),
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
