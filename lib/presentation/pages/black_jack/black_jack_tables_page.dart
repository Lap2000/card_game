import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/back_button.dart';
import 'package:card_game/presentation/components/button/image_button/settings_button.dart';
import 'package:card_game/presentation/components/table/table_list.dart';
import 'package:card_game/presentation/controllers/black_jack_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlackJackTablesPage extends StatelessWidget {
  const BlackJackTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BlackJackController());
    final controller = BlackJackController.to;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstance.backgroundTableImage.path),
              fit: BoxFit.cover,
            ),
          ),
          child: const SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainBackButton(),
                      MainSettingsButton(),
                    ],
                  ),
                ),
                TableList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
