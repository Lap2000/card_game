import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/app/config/const/assets_const.dart';
import 'package:flutter/material.dart';

enum Suit {
  spades,
  hearts,
  diamonds,
  clubs,
}

const CARD_SUITS = [
  Suit.spades,
  Suit.hearts,
  Suit.diamonds,
  Suit.clubs,
];

extension SuitExtention on Suit {
  // Get suit-image
  static String getSuitImagePath(Suit suit) {
    switch (suit) {
      case Suit.spades:
        return AssetsConstance.spadeSVG.path;
      case Suit.clubs:
        return AssetsConstance.clubSVG.path;
      case Suit.diamonds:
        return AssetsConstance.diamondSVG.path;
      default:
        return AssetsConstance.heartSVG.path;
    }
  }

  Color getColor() {
    switch (this) {
      case Suit.spades:
        return AppColors.black.color;
      case Suit.clubs:
        return AppColors.black.color;
      default:
        return AppColors.red.color;
    }
  }
}
