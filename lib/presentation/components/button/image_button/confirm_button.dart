import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

import 'custom_image_button/custom_image_button.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 40,
    this.confirmAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? confirmAction;

  @override
  Widget build(BuildContext context) {
    return CustomImageButton(
      path: AssetsConstance.yesDialogIcon.path,
      padding: padding,
      action: confirmAction,
      size: size,
    );
  }
}
