import 'package:card_game/ui/controllers/login_controller.dart';
import 'package:card_game/utils/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
        ),
      ),
    );
  }
}
