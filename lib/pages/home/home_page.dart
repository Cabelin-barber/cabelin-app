import 'package:cabelin_v2/widgets/appbar_widget.dart';
import 'package:cabelin_v2/widgets/category_widget.dart';
import 'package:cabelin_v2/widgets/list_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(showNotifications: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                "Olá, Carlos! \no que temos para hoje?",
                customFontsize: 16,
                margin: EdgeInsets.only(bottom: 16),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CategoryWidget(
                      title: "Saloes",
                      imageUrl: "assets/salao.png",
                      onTap: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CategoryWidget(
                      title: "Barba",
                      imageUrl: "assets/barbearia.png",
                      onTap: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CategoryWidget(
                      title: "Tatto",
                      imageUrl: "assets/tatuagem.png",
                      onTap: () {},
                    ),
                  ),
                  CategoryWidget(
                    title: "SPA",
                    imageUrl: "assets/spa.png",
                    onTap: () {},
                  ),
                ],
              ),
              Container(
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
              const TextWidget(
                "Salões em destaque",
                margin: EdgeInsets.only(bottom: 16)
              ),
              SizedBox(
                height: 220,
                child: ListWidget(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, __) => Container(
                      width: 220,
                      decoration: const BoxDecoration(
                        color: Color(0XFFF8EDFF),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Salão do Zé",
                                      customFontsize: 16,
                                      customWeight: FontWeight.w800,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber
                                        ),
                                        TextWidget(
                                          "5.0",
                                          customFontsize: 16,
                                          customWeight: FontWeight.w800,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TextWidget(
                                  "10 - 19hrs",
                                  customFontsize: 12,
                                ),
                                TextWidget(
                                  "Av Rochedo, Qd. 22",
                                  customFontsize: 12
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                ),
              ),
              const TextWidget(
                "Todos os salões",
                margin: EdgeInsets.symmetric(vertical:22)
              ),
              ListWidget(
                itemCount: 15,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => ListTile(
                  leading: Container(
                    color: Colors.blue,
                    width: 60,
                    height: 60,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline_rounded)
                  ),
                  title: const TextWidget("Salão Manonzette", customFontsize: 16),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget("10 - 16hrs ⦿ ", customFontsize: 13),
                            Row(
                              children: [
                                TextWidget(
                                  "5.0",
                                  customFontsize: 16,
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber
                                ),
                              ],
                            ),
                        ],
                      ),
                      TextWidget("Av. Plinio Valério", customFontsize: 13),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
