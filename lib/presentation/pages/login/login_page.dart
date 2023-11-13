import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/utils/dialog_util.dart';
import 'package:card_game/presentation/components/button/image_button/animated_button/animated_button.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:card_game/presentation/components/frame/login_frame.dart';
import 'package:card_game/presentation/controllers/login_controller.dart';
import 'package:card_game/presentation/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final controller = LoginController.to;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstance.bGForestImage.path),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageButton(
                        path: AssetsConstance.langIcon.path,
                        action: DialogUtil.showLanguageDialog,
                      ),
                    ],
                  ),
                  LoginFrame(
                    action: () {
                      Get.toNamed(Pages.home.pageName);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedButton(
                        path: AssetsConstance.fbIcon.path,
                        size: 40,
                        action: () {
                          Get.toNamed(Pages.blackJack.pageName);
                        },
                      ),
                      const SizedBox(width: 16),
                      AnimatedButton(
                        path: AssetsConstance.ggIcon.path,
                        size: 40,
                        action: () {
                          Get.toNamed(Pages.blackJackTables.pageName);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
