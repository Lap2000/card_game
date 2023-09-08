import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/app/type/suits_enum.dart';

class PlayingCard {
  PlayingCard(this.suit, this.value);

  final Suit suit;

  final CardValue value;
}
