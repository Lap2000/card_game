import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

import 'custom_image_button/custom_image_button.dart';

class MainSettingsButton extends StatelessWidget {
  const MainSettingsButton({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 40,
    this.settingsAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? settingsAction;

  @override
  Widget build(BuildContext context) {
    return CustomImageButton(
      path: AssetsConstance.settingsIcon.path,
      padding: padding,
      action: settingsAction,
      size: size,
    );
  }
}
