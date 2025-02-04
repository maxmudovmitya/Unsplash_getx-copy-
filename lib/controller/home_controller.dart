import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  int currentTap = 0;

  void changePage(int index) {
    currentTap = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    update();
  }
}
