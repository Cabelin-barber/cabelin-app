import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController pageController = PageController();

  handleChangePage(int index) {
    _currentIndex = index;
  }

  handleChangePageByNavigation(int index) {
    _currentIndex = index;
    pageController.jumpToPage(index);
  }
}