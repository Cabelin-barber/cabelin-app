import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'pageview_controller.g.dart';

class PageViewController = _PageViewControllerBase with _$PageViewController;

abstract class _PageViewControllerBase with Store {
  
  @observable
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PageController pageController = PageController();

  @action
  handleChangePage(int index) {
    _currentIndex = index;
  }

  @action
  handleChangePageByNavigation(int index) {
    _currentIndex = index;
    pageController.jumpToPage(index);
  }
}