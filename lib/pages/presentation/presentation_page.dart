import 'package:cabelin_v2/widgets/text_button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PresentationPage extends StatefulWidget {
  PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  List presentation = [
    {
      "title": "Bem-vindo",
      "description": "DESCRICAO 1"
    },
    {
      "title": "Titulo 2",
      "description": "DESCRICAO 2"
    },
    {
      "title": "Titulo 3",
      "description": "DESCRICAO 3"
    },
    {
      "title": "Titulo 4",
      "description": "DESCRICAO 4"
    }
  ];

  int currentPage = 0;
  PageController controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 120,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  print(index);
                  currentPage = index;
                });
              } ,
              controller: controllerPage,
              children: presentation.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(e["title"]),
                    TextWidget(e["description"])
                  ],
                );
              }).toList()
            ),
          ),

          SmoothPageIndicator(
            controller: controllerPage,
            count: 4
          ),
          TextButtonWidget(
            margin: const EdgeInsets.only(top: 16),
            title: currentPage == 3 ? "Continuar" : "Pular",
            onTap: () {
              context.go("/request_location");
            }
          )
        ],  
      ),
    );
  }
}