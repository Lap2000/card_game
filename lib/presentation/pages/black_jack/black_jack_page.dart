import 'dart:math';

import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:card_game/app/utils/Localization/localkeys.dart';
import 'package:card_game/app/utils/dialog_util.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:card_game/presentation/components/button/image_button/back_button.dart';
import 'package:card_game/presentation/components/button/image_button/settings_button.dart';
import 'package:card_game/presentation/components/card/card_list.dart';
import 'package:card_game/presentation/components/card/free_cards.dart';
import 'package:card_game/presentation/components/card/player_card/custom_playing_card.dart';
import 'package:card_game/presentation/components/card/playing_player.dart';
import 'package:card_game/presentation/controllers/black_jack_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlackJackPage extends StatelessWidget {
  const BlackJackPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BlackJackController());
    final controller = BlackJackController.to;

    late void Function() callGetCardAnimation;

    final list = [
      PlayingCard(Suit.hearts, CardValue.ace),
      PlayingCard(Suit.spades, CardValue.ace),
      PlayingCard(Suit.diamonds, CardValue.ace),
      PlayingCard(Suit.clubs, CardValue.ace),
      PlayingCard(Suit.clubs, CardValue.ace),
    ];
    final list1 = <PlayingCard>[
      PlayingCard(Suit.hearts, CardValue.ace),
      PlayingCard(Suit.spades, CardValue.ace),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstance.backgroundInTableImage.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstance.pokerTableImage.path),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  // Back button
                  Positioned(
                    top: 10,
                    left: 10,
                    child: MainBackButton(
                      padding: EdgeInsets.zero,
                      backAction: () {
                        DialogUtil.showConfirmDialog(
                          context,
                          title: LocaleKeys.back.tr,
                          confirmAction: Get.back,
                        );
                      },
                    ),
                  ),
                  // Settings button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: MainSettingsButton(
                      padding: EdgeInsets.zero,
                      settingsAction: () {
                        callGetCardAnimation();
                      },
                    ),
                  ),
                  // top - left
                  Positioned(
                    top: 10,
                    left: Get.width / 4 - (200 / 2),
                    child: PlayingPlayer(
                      cardList: list,
                      isLast: false,
                    ),
                  ),
                  // top - right
                  Positioned(
                    top: 10,
                    left: Get.width / 4 * 3 - (200 / 2),
                    child: PlayingPlayer(
                      cardList: list,
                      isLast: true,
                    ),
                  ),
                  // center - left
                  Positioned(
                    top: Get.height / 2 - 40,
                    left: 10,
                    child: PlayingPlayer(
                      cardList: list,
                      isLast: false,
                    ),
                  ),
                  // center - right
                  Positioned(
                    top: Get.height / 2 - 40,
                    right: 10,
                    child: PlayingPlayer(
                      cardList: list,
                      isLast: true,
                    ),
                  ),
                  // bottom - left
                  Positioned(
                    bottom: 10,
                    left: Get.width / 4 - (200 / 2),
                    child: PlayingPlayer(
                      cardList: const [],
                      cardListWidget: getCardAnimation(),
                      isLast: false,
                    ),
                  ),
                  // bottom - right
                  Positioned(
                    bottom: 10,
                    left: Get.width / 4 * 3 - (200 / 2),
                    child: PlayingPlayer(
                      cardList: list,
                      isLast: true,
                    ),
                  ),
                  // center - free cards
                  Positioned(
                    top: Get.height / 2 - 55,
                    left: Get.width / 2 - 40,
                    child: FreeCards(
                      action: controller.hitFreeCards,
                      builder: (
                        BuildContext context,
                        void Function() func,
                      ) {
                        callGetCardAnimation = func;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardFake() {
    ShapeBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: const BorderSide(color: Colors.black, width: 1));
    final card = PlayingCard(Suit.hearts, CardValue.ten);
    return Center(
      child: SizedBox(
        height: 80,
        width: 60,
        child: CustomPlayerCard(
          card: card,
          showBack: false,
          elevation: 3,
          shape: shape,
        ),
      ),
    );
  }

  Widget getCardAnimation() {
    Get.put(BlackJackController());
    final controller = BlackJackController.to;

    return Obx(
      () => Transform(
        alignment:
            controller.isChange.value ? Alignment.center : Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi * controller.animation.value.value),
        child: GestureDetector(
          onTap: () {
            if (controller.animationStatus == AnimationStatus.dismissed) {
              controller.animationController.value.forward();
            } else {
              controller.animationController.value.reverse();
            }
          },
          child: Center(
            child: Obx(
              () => CardList(
                cardList: controller.player1.value.cards,
                isShowBack:
                    controller.animation.value.value >= 0.5 ? true : false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
