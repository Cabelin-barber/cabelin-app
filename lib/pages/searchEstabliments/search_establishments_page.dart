import 'package:cabelin_v2/pages/explore/components/location/location_page.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:cabelin_v2/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SearchEstablishmentsPage extends StatelessWidget {
  const SearchEstablishmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppbarWidget(),
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
                    ),
                    TextButton.icon(
                      onPressed: () {
                                                showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => LocationPage());
                      },
                      icon: const Icon(Icons.location_pin),
                      label: const TextWidget("Goiânia")
                    )
                  ],
                ),
              )
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    title: const TextWidget("Barbearia do Marcos"),
                    subtitle: const TextWidget("Avenida Plinio"),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );  
  }
}