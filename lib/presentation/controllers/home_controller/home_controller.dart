import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  static HomeController get to => Get.find<HomeController>();

  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  late final AnimationController animationController;
  late Animation<double> transAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> optionsFadeAnimation;
  late Animation<double> optionsTransAnimation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    transAnimation = Tween(begin: 500.0, end: 0.0).animate(animationController)
      ..addListener(() {})
      ..addStatusListener((status) {
        animationStatus = status;
      });
    optionsTransAnimation =
        Tween(begin: 700.0, end: 700.0).animate(animationController);
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    optionsFadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
  }

  void callAnimation({
    double positionX1 = 0.0,
    double positionX2 = -500.0,
    double optionPositionX1 = 700.0,
    double optionPositionX2 = 0.0,
    double fadeBegin = 0.0,
    double fadeEnd = 1.0,
  }) {
    setTransAnimation(positionX1, positionX2);
    setOpsTransAnimation(optionPositionX1, optionPositionX2);
    setFadeAnimation(fadeEnd, fadeBegin);
    setOpsFadeAnimation(fadeBegin, fadeEnd);
    animationController.reset();
    animationController.forward();
  }

  setOpsTransAnimation(double optionPositionX1, double optionPositionX2) {
    optionsTransAnimation =
        Tween(begin: optionPositionX1, end: optionPositionX2)
            .animate(animationController);
  }

  setTransAnimation(double positionX1, double positionX2) {
    transAnimation =
        Tween(begin: positionX1, end: positionX2).animate(animationController);
  }

  setFadeAnimation(double fadeBegin, double fadeEnd) {
    fadeAnimation =
        Tween(begin: fadeBegin, end: fadeEnd).animate(animationController);
  }

  setOpsFadeAnimation(double fadeBegin, double fadeEnd) {
    optionsFadeAnimation =
        Tween(begin: fadeBegin, end: fadeEnd).animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
