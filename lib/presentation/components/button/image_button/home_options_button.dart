import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/text/app_text.dart';
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
    return InkWell(
      onTap: action ?? () {},
      child: Container(
        width: 220 * scale,
        height: scale >= 1.5 ? 150 : 100,
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
        child: AppText(
          text: title,
          fontSize: 28,
          fontFamily: path ?? AssetsConstance.mainFontFamily.path,
        ),
      ),
    );
  }
}
