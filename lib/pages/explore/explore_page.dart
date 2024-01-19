import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/pages/explore/explore_controller.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_page.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/listable_refresh.dart';
import 'package:cabelin_v2/widgets/smart_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreController explorerControler = ExploreController();
    String urlImage =
        "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      body: CustomMaterialIndicator(
        indicatorBuilder: (_, __) => const CircularProgressIndicator.adaptive(),
        onRefresh: () async {
          explorerControler.getEstablishments();
        },
        child: CustomScrollView(
          controller: explorerControler.scrollController,
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.teal[900],
                pinned: false,
                snap: true,
                floating: true,
                expandedHeight: 160.0,
                centerTitle: true,
                title: Observer(
                  builder: (contenxt) => TextButtonWidget(
                      icon: Icons.expand_more_rounded,
                      title: explorerControler.currentLocation == null
                          ? "Buscar pela minha localização"
                          : explorerControler.currentLocation!.city,
                      onTap: () {
                        showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => LocationPage());
                      }),
                ),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(90.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              String? search = await  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SearchEstablishmentsPage(
                                    currentSearch: explorerControler.nameEstablishmentController.text
                                  ),
                                )
                              );
                              if(search != null && search.isNotEmpty) {
                                explorerControler.nameEstablishmentController.text = search;
                                explorerControler.searchEstablishmentByName(search);
                              }else {
                                explorerControler.nameEstablishmentController.clear();
                              }
                            },
                            child: TextfieldWidget(
                              hintText: "Nome do local",
                              controller: explorerControler.nameEstablishmentController,
                              enabled: false,
                            ),
                          ),
                          const TextWidget(
                            "Quando?",
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 6),
                          )
                        ],
                      ),
                    ))),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: Observer(builder: (_) {
                        return SliverList(  
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => context.push(
                                "/estableshiment/${explorerControler.allEstablishments[index].id}"
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                          Image.network(urlImage),
                          TextWidget(
                            explorerControler.allEstablishments[index].name,
                            customFontsize: 20,
                            customWeight: FontWeight.w800,
                          ),
                          TextWidget(
                            explorerControler.allEstablishments[index].address.city,
                            color: Colors.grey[700]
                          )
                        ]),
                      );
                    },
                                        childCount: explorerControler.allEstablishments.length,
                                      ),
                                    );
                                  }),
                    ),
          ],
        ),
      ),
    );
  }
}
