import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_controller.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class SearchEstablishmentsPage extends StatelessWidget {
  const SearchEstablishmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SearchEstablishmentsController();
    return Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextfieldWidget(
                      hintText: "Pesquisa pela empresa ou serviço",
                      autofocus: true,
                      onSubmit: (String? value) {
                        context.pop(value);
                      },
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => LocationPage()
                        );
                      },
                      icon: const Icon(Icons.location_pin),
                      label: Observer(builder: (_) {
                        return TextWidget(
                          controller.currentLocation == null
                          ? "Buscar pela minha localização"
                          : controller.currentLocation!.city,
                        );
                      })
                    )
                  ],
                ),
              )
            )
          ),
            Observer(
              builder: (_) => SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverFillRemaining(
                child: ListWidget(
                  isEmpty: controller.allEstablishments.isEmpty && controller.isLoadingEstablishment == false,
                  isLoading: controller.isLoadingEstablishment,
                  itemBuilder: (_, index) {
                    final establishment = controller.allEstablishments[index];
                    return ListTile(
                      onTap: () => context.push(
                        "/estableshiment/${establishment.id}"
                      ),
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                      title: TextWidget(establishment.name),
                      subtitle: TextWidget(establishment.address.city),
                    );
                  },
                  itemCount: controller.allEstablishments.length
                ),
              )
            ),
          ),
        ],
      ),
    );  
  }
}