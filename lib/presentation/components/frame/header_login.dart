import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/text/app_text.dart';
import 'package:card_game/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.to;
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsConstance.headerFrameImage.path),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Obx(
        () => AppText(
          text: controller.appBarTitle.value,
          color: Colors.black87,
        ),
      ),
    );
  }
}
