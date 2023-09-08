import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 40,
    this.backAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? backAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: backAction ?? Get.back,
        child: Image.asset(
          AssetsConstance.backIcon.path,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
