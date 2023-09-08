import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

class MainSettingsButton extends StatelessWidget {
  const MainSettingsButton({
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
        onTap: backAction ?? () {},
        child: Image.asset(
          AssetsConstance.settingsIcon.path,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
