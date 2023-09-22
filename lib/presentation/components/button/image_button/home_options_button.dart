import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

class HomeOptionsButton extends StatelessWidget {
  const HomeOptionsButton({
    super.key,
    this.padding = EdgeInsets.zero,
    this.width = 250,
    this.height = 200,
    this.path,
    this.action,
    this.scale = 1.0,
    required this.title,
  });

  final EdgeInsets padding;
  final String? path;
  final double width;
  final double height;
  final VoidCallback? action;
  final String title;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100 * scale,
      width: 250 * scale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: AssetImage(
            AssetsConstance.homeOptionImage.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: action ?? () {},
        child: Container(
          width: 180 * scale,
          height: 70 * scale,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 28 * scale,
              color: AppColors.white.color,
              fontFamily: path ?? AssetsConstance.mainFontFamily.path,
              height: 1.2 * scale,
            ),
          ),
        ),
      ),
    );
  }
}
