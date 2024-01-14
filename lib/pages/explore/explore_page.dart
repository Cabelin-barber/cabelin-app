import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/pages/explore/explore_controller.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/smart_refresh_widget.dart';
import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreController homeController = ExploreController();
    String urlImage =
        "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      body: SmartRefreshWidget(
        loadMore: () async {
          await homeController.loadMoreEstablishments();
        },
        onRefresh: () async {
          await homeController.getEstablishments();
        },
        child: CustomScrollView(
          controller: homeController.scrollController,
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
                      title: homeController.currentLocation == null
                          ? "Buscar pela minha localização"
                          : homeController.currentLocation!.city,
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
                          TextfieldWidget(
                            hintText: "Nome do local",
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
                      );
                    },
                                        childCount: homeController.allEstablishments.length,
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
