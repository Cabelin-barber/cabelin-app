import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:cabelin_v2/widgets/button_widget.dart';
import 'package:cabelin_v2/widgets/layout_widget.dart';
import 'package:cabelin_v2/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isThereBooking = false;
    PageViewController pageViewController = GetIt.I<PageViewController>();
    String urlImage = "https://images.unsplash.com/photo-1546877625-cb8c71916608?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";


    return Scaffold(
      body: LayoutWidget(
        child: Visibility(
          visible: isThereBooking,
        replacement: CustomMaterialIndicator(
            indicatorBuilder: (context, controller) => const CupertinoActivityIndicator(),
            onRefresh: () async {

            },
            child: ListView.separated(
              separatorBuilder: (_, __) => Container(height: 20),
              shrinkWrap: true,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Get.toNamed("/bookingInformation"),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.grey[100],
                  ),
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(Radius.circular(100))
                        ),
                        child: const TextWidget(
                          "Confirmado",
                          customFontsize: 13,
                          color: Colors.green,
                          customWeight: FontWeight.w800,
                        ),
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              urlImage,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const TextWidget(
                            "Salão da Patricia",
                            customWeight: FontWeight.w800,
                            margin: EdgeInsets.only(left: 16)
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.chevron_right_rounded)
                            )
                          )
                        ],
                      ),
                      const Divider(),
                      const TextWidget("Corte Degradê"),
                            
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            "1 de Janeiro, 13:00",
                            customWeight: FontWeight.w800
                          )
                        ),
                      )
                    ],
                  )
                ),
              ),
              itemCount: 25
            ),
          ),
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