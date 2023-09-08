import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
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
          child: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainBackButton(
                              padding: EdgeInsets.zero,
                              backAction: () {
                                DialogUtil.showGetBackDialog();
                              },
                            ),
                            MainSettingsButton(
                              padding: EdgeInsets.zero,
                              backAction: () {
                                callGetCardAnimation();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: PlayingPlayer(
                                cardList: list,
                                isLast: false,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: PlayingPlayer(
                                cardList: list,
                                isLast: false,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: PlayingPlayer(
                                cardList: list1,
                                isLast: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlayingPlayer(
                            cardList: list1,
                          ),
                          PlayingPlayer(
                            cardList: list,
                            isLast: true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // const ExampleCardFan(),
                      getCardAnimation(),
                      //cardFake(),
                    ],
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Expanded(
                          child: FreeCards(
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
      child: Container(
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

  // Widget cardsFake() {
  //   Get.put(BlackJackController());
  //   final controller = BlackJackController.to;
  //
  //   return Obx();
  // }

  Widget getCardAnimation() {
    Get.put(BlackJackController());
    final controller = BlackJackController.to;

    final list = [
      PlayingCard(Suit.hearts, CardValue.ten),
      PlayingCard(Suit.spades, CardValue.nine),
      PlayingCard(Suit.diamonds, CardValue.jack),
      PlayingCard(Suit.clubs, CardValue.ace),
    ];

    return Obx(
      () => Transform(
        alignment:
            controller.isChange.value ? Alignment.center : Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(3.14 * controller.animation.value.value),
        child: GestureDetector(
          onTap: () {
            if (controller.animationStatus == AnimationStatus.dismissed) {
              controller.animationController.value.forward();
            } else {
              controller.animationController.value.reverse();
            }
          },
          child: Center(
            child: CardList(
              cardList: list,
              isShowBack:
                  controller.animation.value.value >= 0.5 ? true : false,
            ),
          ),
        ),
      ),
    );
  }

  // Widget addCardContainer() {
  //   return const Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       FreeCards(),
  //     ],
  //   );
  // }
}
