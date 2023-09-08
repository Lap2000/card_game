import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPlayerCard extends StatelessWidget {
  final PlayingCard card;

  final bool showBack;

  final ShapeBorder? shape;

  final double? elevation;

  const CustomPlayerCard(
      {Key? key,
      required this.card,
      this.showBack = false,
      this.shape,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardContent;

    if (showBack) {
      cardContent = Image.asset(
        AssetsConstance.backCard5Image.path,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      );
    } else {
      cardContent = Stack(
        children: [
          Positioned(
            top: 0,
            left: card.value == CardValue.ten ? 1 : 5,
            child: card.value == CardValue.ten
                ? tenCardTitle()
                : textTitleOfCard(card.value.getStringValue()),
          ),
          Positioned(
            top: 5,
            left: 15,
            child: SvgPicture.asset(
              SuitExtention.getSuitImagePath(card.suit),
              width: 10,
              height: 10,
            ),
          ),
          Positioned(
            top: 22,
            left: 4,
            child: SvgPicture.asset(
              SuitExtention.getSuitImagePath(card.suit),
              width: 10,
              height: 10,
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: card.value.getImage(card.suit),
          ),
        ],
      );
    }

    return AspectRatio(
      aspectRatio: playingCardAspectRatio,
      child: Card(
        shape: shape,
        elevation: elevation,
        clipBehavior: Clip.antiAlias,
        child: cardContent,
      ),
    );
  }

  Widget textTitleOfCard(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 20,
        fontFamily: AssetsConstance.cardFontFamily.path,
        color: card.suit.getColor(),
      ),
    );
  }

  Widget tenCardTitle() {
    return SizedBox(
      width: 14,
      child: Stack(
        children: [
          textTitleOfCard('1'),
          Positioned(
            left: 6,
            child: textTitleOfCard('0'),
          ),
        ],
      ),
    );
  }

  Widget normalCard(String path) {
    return SizedBox(
      height: 45,
      width: 34,
      child: SvgPicture.asset(
        AssetsConstance.clubSVG.path,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget faceCard(String path) {
    return SizedBox(
      height: 52,
      width: 32,
      child: Image.asset(
        AssetsConstance.kingCard.path,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        scale: 0.1,
      ),
    );
  }
}

const double playingCardAspectRatio = 64.0 / 89.0;
