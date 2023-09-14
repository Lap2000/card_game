import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:card_game/infrastructure/models/black_jack_player/black_jack_player.dart';
import 'package:card_game/infrastructure/models/deck_of_cards/deck_of_cards.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
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
  Rx<BlackJackPlayer> player1 = BlackJackPlayer().obs;

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

    deckOfCards.value.shuffle();
    hitFreeCards();
    hitFreeCards();
  }

  hitFreeCards() {
    if (deckOfCards.value.cards.isNotEmpty && player1.value.cards.length < 5) {
      final newCard =
          deckOfCards.value.hit() ?? PlayingCard(Suit.hearts, CardValue.ace);
      player1.value.addCard(newCard);
      player1.refresh();
      print('length : ${player1.value.cards.length}');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.value.dispose();
    super.dispose();
  }
}
