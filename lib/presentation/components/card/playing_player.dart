import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:card_game/presentation/components/avatar/playing_avatar.dart';
import 'package:card_game/presentation/components/card/card_list.dart';
import 'package:flutter/material.dart';

class PlayingPlayer extends StatelessWidget {
  const PlayingPlayer({
    super.key,
    required this.cardList,
    this.padding = const EdgeInsets.only(top: 20),
    this.size = 20,
    this.isLast = false,
    this.cardListWidget,
  });

  final EdgeInsets padding;
  final double size;
  final bool isLast;
  final List<PlayingCard> cardList;
  final Widget? cardListWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment:
            isLast ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isLast) const PlayingAvatar(),
          cardListWidget ?? CardList(cardList: cardList),
          if (isLast) const PlayingAvatar(),
        ],
      ),
    );
  }
}
