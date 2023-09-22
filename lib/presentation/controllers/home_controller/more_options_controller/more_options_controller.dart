import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MoreOptionsController extends GetxController
    with GetTickerProviderStateMixin {
  static MoreOptionsController get to => Get.find<MoreOptionsController>();

  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  late final AnimationController animationController;
  late Animation<double> transAnimation1;
  late Animation<double> transAnimation2;
  late Animation<double> transAnimation3;

  // var : check options(showing/hiding) to set UI
  RxBool isShowing = false.obs;
  // var : check options(showing/hiding) to set Animation
  RxBool isHiding = false.obs;

  double position1 = 145.0;
  double position2 = 100.0;
  double position3 = 60.0;
  double zeroPosition = 0.0;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    setAnimation();
  }

  void callAnimation() {
    setAnimation();
    animationController.reset();
    animationController.forward();
    isShowing.value = !isShowing.value;
  }

  setAnimation() {
    if (isHiding.value) {
      transAnimation1 = Tween(begin: zeroPosition, end: position1)
          .animate(animationController)
        ..addStatusListener((status) {
          animationStatus = status;
          if (animationStatus == AnimationStatus.completed) {
            isHiding.value = false;
          }
        });
      transAnimation2 = Tween(begin: zeroPosition, end: position2)
          .animate(animationController);
      transAnimation3 = Tween(begin: zeroPosition, end: position3)
          .animate(animationController);
    } else {
      transAnimation1 = Tween(begin: position1, end: zeroPosition)
          .animate(animationController)
        ..addStatusListener((status) {
          animationStatus = status;
          if (animationStatus == AnimationStatus.completed) {
            isHiding.value = true;
          }
        });
      transAnimation2 = Tween(begin: position2, end: zeroPosition)
          .animate(animationController);
      transAnimation3 = Tween(begin: position3, end: zeroPosition)
          .animate(animationController);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
