import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/presentation/components/avatar/circle_avatar.dart';
import 'package:flutter/material.dart';

class PlayingAvatar extends StatelessWidget {
  const PlayingAvatar({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 20,
    this.backAction,
    this.imageUrl = 'https://cdn-icons-png.flaticon.com/512/5556/5556468.png',
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? backAction;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomCircleAvatar(),
        const SizedBox(height: 4),
        Text(
          '14.000 \$',
          style: TextStyle(color: AppColors.white.color),
        ),
      ],
    );
  }
}
