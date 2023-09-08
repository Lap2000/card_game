import 'package:card_game/app/type/card_value_enum.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';

class BlackJackCards {
  BlackJackCards(this._cards);

  final List<PlayingCard> _cards;

  int valueOfCards() {
    int total = 0;
    final cards = _getCardsWithAcesAtTheEndOfCards();
    for (int i = 0; i < cards.length; i++) {
      if (cards.length == 3 && cards[i].value == CardValue.ace && i == 1) {
        total += cards[i].value.getIntValue();
      } else if (cards.length == 3 &&
          cards[i].value == CardValue.ace &&
          i == 2 &&
          total < 11) {
        total += cards[i].value.getAceIntValue(11);
      } else if (cards.length == 3 &&
          cards[i].value == CardValue.ace &&
          i == 2 &&
          total == 11) {
        total += cards[i].value.getAceIntValue(10);
      } else {
        total += cards[i].value.getIntValue();
      }
    }
    return total;
  }

  // Get cards with aces at the end of cards
  List<PlayingCard> _getCardsWithAcesAtTheEndOfCards() {
    final List<PlayingCard> cardsTemp = _cards;
    final List<PlayingCard> aces = [];
    // find aces and move to temp
    for (var item in _cards) {
      if (item.value == CardValue.ace) {
        cardsTemp.remove(item);
        aces.insert(0, item);
      }
    }
    // move aces to end of cards
    cardsTemp.insertAll(cardsTemp.length - 1, aces);
    return cardsTemp;
  }

  // check Ace
  bool hasAce() {
    for (var item in _cards) {
      if (item.value == CardValue.ace) {
        return true;
      }
    }
    return false;
  }

  // Add card
  addCard(PlayingCard card) {
    _cards.insert(_cards.length - 1, card);
  }
}
