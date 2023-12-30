import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isThereBooking = true;
    PageViewController pageViewController = GetIt.I<PageViewController>();

    return Scaffold(
      body: Visibility(
        visible: isThereBooking,
        replacement: const Column(
          children: [
            TextWidget("Replace")
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.network("https://lottie.host/abd73192-94ce-4ed1-94f2-2f19440b1046/0TPpL0oGZL.json"),
              const TextWidget(
                "Parece que você ainda não fez \nnenhum agendamento",
                customWeight: FontWeight.w800,
                textAlign: TextAlign.center
              ),
              const TextWidget(
                "Faça o agendamento com os\n melhores em poucos rapidamente!",
                textAlign: TextAlign.center,
                customFontsize: 13,
                margin: EdgeInsets.only(top: 16, bottom: 16),
              ),
              ButtonWidget(
                title: "Agendar agora",
                onTap: () {
                  pageViewController.pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}