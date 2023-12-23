import 'package:cabelin_v2/pages/calendar/calendar_page.dart';
import 'package:cabelin_v2/pages/home/home_page.dart';
import 'package:cabelin_v2/pages/pageview/pageview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PageViewApp extends StatelessWidget {
  const PageViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    PageViewController controller = PageViewController();

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (int index) {
          controller.handleChangePage(index);
        },
        children: const [
          HomePage(),
          CalendarPage()
        ],
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (int index) {
            controller.handleChangePageByNavigation(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/home.svg"),
              label: "Home",
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset("assets/search.svg"),
            //   label: "Buscar"
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/calendar.svg"),
              label: "Agenda"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/favorite.svg"),
              label: "Favoritos"
            )
            ]);
      }),
    );
  }
}