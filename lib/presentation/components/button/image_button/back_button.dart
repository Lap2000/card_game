import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:flutter/material.dart';

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
    return CustomImageButton(
      path: AssetsConstance.backIcon.path,
      padding: padding,
      action: backAction,
      size: size,
    );
  }
}
