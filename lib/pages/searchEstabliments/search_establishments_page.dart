import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/pages/explore/explore_controller.dart';
import 'package:cabelin_v2/pages/searchEstabliments/search_establishments_controller.dart';
import 'package:cabelin_v2/utils/debouncer.dart';
import 'package:cabelin_v2/widgets/chip_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchEstablishmentsPage extends StatelessWidget {

  String? currentSearch;

  SearchEstablishmentsPage({super.key, this.currentSearch});
  final controller = SearchEstablishmentsController();

  @override
  Widget build(BuildContext context) {
    final textfieldController = TextEditingController(text: currentSearch);
    final debouncer = Debouncer(milliseconds: 400);

    return GetBuilder(
      init: SearchEstablishmentsController(),
      builder: (controller) => Scaffold(
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
                        controller: textfieldController,
                        hintText: "Pesquise pela empresa ou serviço",
                        autofocus: true,
                        onSubmit: (String? value) {
                          Get.find<ExploreController>().didSearchEstablishmentByName(value);
                          Get.back();
                        },
                        onChanged: (String value) {
                          debouncer.run(() {
                            controller.searchEstablishments(value);
                          });
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
                        label: TextWidget(
                            controller.currentLocation == null
                            ? "Buscar pela minha localização"
                            : controller.currentLocation!.city,
                          )
                      )
                    ],
                  ),
                )
              )
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget("Serviços populares", margin: EdgeInsets.only(bottom: 6),),
                    Wrap(
                      spacing: 16,
                      runSpacing: 10,
                      children: ["Barba", "Degrade", "Cabelo", "Social", "Alisamento", "Pintura", "Regua"].map((e) {
                        return ChipWidget(title: e, onTap: () {
                          Navigator.of(context).pop(e);
                          // context.pop(e);
                          textfieldController.text = e.toString();
                          controller.searchEstablishments(e);
                        });
                      }).toList()
                    )
                  ],
                ),
              ),
            ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverFillRemaining(
                  child: ListWidget(
                    customEmpty: Container(),
                    isEmpty: controller.allEstablishments.isEmpty && controller.isLoadingEstablishment == false,
                    isLoading: controller.isLoadingEstablishment,
                    itemBuilder: (_, index) {
                      final establishment = controller.allEstablishments[index];
                      return ListTile(
                        onTap: () => Get.toNamed(
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
          ],
        ),
      ),
    );  
  }
}
