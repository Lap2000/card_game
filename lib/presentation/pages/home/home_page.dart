import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:card_game/presentation/components/button/image_button/back_button.dart';
import 'package:card_game/presentation/components/button/image_button/settings_button.dart';
import 'package:card_game/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final controller = HomeController.to;
    ShapeBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: Colors.black, width: 1));
    final list = [
      PlayingCard(Suit.hearts, CardValue.ace),
      PlayingCard(Suit.spades, CardValue.ace),
      PlayingCard(Suit.diamonds, CardValue.ace),
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
              image: AssetImage(AssetsConstance.mainBackgroundImage.path),
              fit: BoxFit.cover,
            ),
          ),
          child: const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainBackButton(),
                    MainSettingsButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
