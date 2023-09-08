import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:card_game/presentation/components/card/card_group/card_group.dart';
import 'package:card_game/presentation/components/card/player_card/custom_playing_card.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.cardList, this.isShowBack = true});

  final List<PlayingCard> cardList;
  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    double getWidth(int numberOfCardList) {
      switch (numberOfCardList) {
        case 1:
          return 60;
        case 2:
          return 80;
        case 3:
          return 140;
        case 4:
          return 140;
        case 5:
          return 140;
        default:
          return 0;
      }
    }

    return SizedBox(
      height: 80,
      width: getWidth(cardList.length),
      child: cardList.length > 1
          ? CardGroup(
              children: List.generate(
                  cardList.length, (index) => _card(cardList[index])),
            )
          : cardList.isNotEmpty
              ? _card(cardList[0])
              : const SizedBox.shrink(),
    );
  }

  Widget _card(PlayingCard card) {
    ShapeBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: const BorderSide(color: Colors.black, width: 1));
    return CustomPlayerCard(
      card: card,
      showBack: isShowBack,
      elevation: 3.0,
      shape: shape,
    );
  }
}
