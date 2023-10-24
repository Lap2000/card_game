import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/utils/env/device_info.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color,
    this.fontFamily,
    this.height = 1.2,
    this.shadows,
  });

  final String text;
  final double fontSize;
  final Color? color;
  final String? fontFamily;
  final double height;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize * DeviceInfo().scale(),
        color: color ?? AppColors.white.color,
        fontFamily: fontFamily ?? AssetsConstance.mainFontFamily.path,
        height: height,
        shadows: shadows,
      ),
    );
  }
}
