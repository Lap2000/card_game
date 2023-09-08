import 'package:card_game/infrastructure/models/deck_of_cards/deck_of_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BlackJackController extends GetxController
    with GetTickerProviderStateMixin {
  static BlackJackController get to => Get.find<BlackJackController>();

  // late final AnimationController animationController;
  // late final Animation<double> animation;
  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  late Rx<AnimationController> animationController =
      Rx(AnimationController(vsync: this));

  late Rx<Animation<double>> animation =
      Rx(Tween(begin: 0.0, end: 1.0).animate(animationController.value));

  RxBool isChange = false.obs;

  Rx<DeckOfCards> deckOfCards = DeckOfCards().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController.value = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation.value =
        Tween(begin: 0.0, end: 1.0).animate(animationController.value)
          ..addListener(() {
            isChange.value = !isChange.value;
          })
          ..addStatusListener((status) {
            animationStatus = status;
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.value.dispose();
    super.dispose();
  }
}
