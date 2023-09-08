enum BlackJackResult {
  twoAces,
  blackJack,
  fiveCards,
  cantHit,
  enoughPoints,
  notEnoughPoints,
}

const BLACK_JACK_RESULT_LIST = [
  BlackJackResult.twoAces,
  BlackJackResult.blackJack,
  BlackJackResult.fiveCards,
  BlackJackResult.enoughPoints,
  BlackJackResult.notEnoughPoints,
];

// extension CalculateBlackJackResult on BlackJackResult {
//   static BlackJackResult getBlackJackResult() {
//
//   }
// }
