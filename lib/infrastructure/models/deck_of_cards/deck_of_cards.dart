import 'dart:math';

import 'package:card_game/app/config/const/new_deck_of_cards.dart';
import 'package:card_game/infrastructure/models/playing_card/playing_card.dart';

class DeckOfCards {
  DeckOfCards();

  final List<PlayingCard> _cards = newDeckOfCards;

  get length => _cards.length;

  get cards => _cards;

  // Add card
  addCard(PlayingCard card) {
    _cards.insert(_cards.length - 1, card);
  }

  // shuffle a deck of cards
  shuffle() {
    if (_cards.length > 1) {
      for (int i = 0; i < _cards.length; i++) {
        // Random for remaining positions.
        int randomPosition = i + Random().nextInt(_cards.length - i);

        //swapping the elements
        PlayingCard temp = _cards[randomPosition];
        _cards[randomPosition] = _cards[i];
        _cards[i] = temp;
      }
    }
  }

  // Hit a card in a deck of cards
  PlayingCard? hit() {
    if (_cards.isNotEmpty) {
      PlayingCard temp = _cards[_cards.length - 1];
      _cards.remove(temp);
      return temp;
    }
    return null;
  }
}
