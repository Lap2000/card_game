import 'package:card_game/app/utils/dialog_util.dart';
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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(controller.appBarTitle.value)),
            centerTitle: true,
            leading: const SizedBox.shrink(),
            actions: [
              IconButton(
                onPressed: () {
                  DialogUtil.showLanguageDialog();
                },
                icon: const Icon(Icons.language),
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Pages.home.pageName);
                  },
                  child: const Text('Go Home'),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Pages.blackJack.pageName);
                  },
                  child: const Text('Go Black Jack'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Pages.blackJackTables.pageName);
                  },
                  child: const Text('Go Black Jack Tables'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
