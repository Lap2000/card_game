import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:card_game/presentation/components/button/image_button/home_options_button.dart';
import 'package:card_game/presentation/controllers/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'more_options/more_options_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final controller = HomeController.to;
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
          child: SafeArea(
            child: Stack(
              children: [
                // More options button
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: MoreOptionsButton(),
                ),

                // Main Form
                Center(
                  child: AnimatedBuilder(
                    animation: controller.animationController.view,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(controller.transAnimation.value, 0),
                        child: FadeTransition(
                          opacity: controller.fadeAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              HomeOptionsButton(
                                title: 'PLAY',
                                action: controller.callAnimation,
                              ),
                              HomeOptionsButton(
                                title: 'OPTIONS',
                                action: controller.callAnimation,
                              ),
                              HomeOptionsButton(
                                title: 'EXIT',
                                action: Get.back,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Options
                AnimatedBuilder(
                  animation: controller.animationController.view,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(controller.optionsTransAnimation.value, 0),
                      child: FadeTransition(
                        opacity: controller.optionsFadeAnimation,
                        child: Center(
                          child: Container(
                            height: Get.height * 0.8,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    AssetsConstance.mainFormImage.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 30,
                                  child: CustomImageButton(
                                    path: AssetsConstance.cancelIcon.path,
                                    action: () {
                                      controller.callAnimation(
                                        positionX1: -500.0,
                                        positionX2: 0.0,
                                        optionPositionX1: 0.0,
                                        optionPositionX2: 700.0,
                                        fadeBegin: 1.0,
                                        fadeEnd: 0.0,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
