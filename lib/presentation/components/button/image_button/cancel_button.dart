import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

import 'custom_image_button/custom_image_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 40,
    this.cancelAction,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? cancelAction;

  @override
  Widget build(BuildContext context) {
    return CustomImageButton(
      path: AssetsConstance.cancelIcon.path,
      padding: padding,
      action: cancelAction,
      size: size,
    );
  }
}
