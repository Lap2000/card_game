import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/type/suits_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum CardValue {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace,
}

const SUITED_VALUES = [
  CardValue.two,
  CardValue.three,
  CardValue.four,
  CardValue.five,
  CardValue.six,
  CardValue.seven,
  CardValue.eight,
  CardValue.nine,
  CardValue.ten,
  CardValue.jack,
  CardValue.queen,
  CardValue.king,
  CardValue.ace,
];

extension GetCardValue on CardValue {
  // Get string-value of card
  String getStringValue() {
    switch (this) {
      case CardValue.ace:
        return 'A';
      case CardValue.two:
        return '2';
      case CardValue.three:
        return '3';
      case CardValue.four:
        return '4';
      case CardValue.five:
        return '5';
      case CardValue.six:
        return '6';
      case CardValue.seven:
        return '7';
      case CardValue.eight:
        return '8';
      case CardValue.nine:
        return '9';
      case CardValue.ten:
        return '10';
      case CardValue.jack:
        return 'J';
      case CardValue.queen:
        return 'Q';
      case CardValue.king:
        return 'K';
      default:
        return 'A';
    }
  }

  // Get int-value of card
  int getIntValue() {
    switch (this) {
      case CardValue.ace:
        return 1;
      case CardValue.two:
        return 2;
      case CardValue.three:
        return 3;
      case CardValue.four:
        return 4;
      case CardValue.five:
        return 5;
      case CardValue.six:
        return 6;
      case CardValue.seven:
        return 7;
      case CardValue.eight:
        return 8;
      case CardValue.nine:
        return 9;
      default:
        return 10;
    }
  }

  // Get int-value of ace card
  int getAceIntValue(int value) {
    switch (value) {
      case 10:
        return 10;
      case 11:
        return 11;
      default:
        return 1;
    }
  }
}

extension GetCardImage on CardValue {
  // Get face-card-image path
  String getFaceCardImagePath() {
    switch (this) {
      case CardValue.jack:
        return AssetsConstance.jackCard.path;
      case CardValue.queen:
        return AssetsConstance.queenCard.path;
      case CardValue.king:
        return AssetsConstance.kingCard.path;
      default:
        return AssetsConstance.kingCard.path;
    }
  }

  // Get the image of card
  Widget getImage(Suit suit) {
    switch (this) {
      case CardValue.jack:
        return faceCard();
      case CardValue.queen:
        return faceCard();
      case CardValue.king:
        return faceCard();
      default:
        return normalCard(SuitExtention.getSuitImagePath(suit));
    }
  }

  Widget normalCard(String path) {
    return SizedBox(
      height: 45,
      width: 34,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget faceCard() {
    return SizedBox(
      height: 52,
      width: 32,
      child: Image.asset(
        getFaceCardImagePath(),
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        scale: 0.1,
      ),
    );
  }
}
