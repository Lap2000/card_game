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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircleAvatar(),
        SizedBox(height: 8),
        Text('14.000 \$'),
      ],
    );
  }
}
