enum AssetsConstance {
  // asset - images
  backgroundInTableImage(path: "assets/images/background.png"),
  backgroundTableImage(path: "assets/images/background_green.png"),
  mainBackgroundImage(path: "assets/images/main_background.png"),
  backCardImage(path: "assets/images/back_card.png"),
  backCard2Image(path: "assets/images/back_card_2.png"),
  backCard3Image(path: "assets/images/back_card_3.png"),
  backCard4Image(path: "assets/images/back_card_4.png"),
  backCard5Image(path: "assets/images/back_card_5.png"),
  backCard6Image(path: "assets/images/back_card_6.png"),
  dialogBackground(path: "assets/images/dialog_background.png"),
  selectedBackground(path: "assets/images/selected_background.png"),
  unselectedBackground(path: "assets/images/unselected_background.png"),

  // asset - icons
  table4Icon(path: "assets/icons/table_for_4_people.png"),
  table6Icon(path: "assets/icons/table_for_6_people.png"),
  settingsIcon(path: "assets/icons/settings_icon_main.png"),
  backIcon(path: "assets/icons/back_button.png"),
  cancelIcon(path: "assets/icons/cancel_button_image.png"),
  yesIcon(path: "assets/icons/yes_button_image.png"),

  // asset - suits
  clubSVG(path: "assets/suits/club.svg"),
  diamondSVG(path: "assets/suits/diamond.svg"),
  heartSVG(path: "assets/suits/heart.svg"),
  spadeSVG(path: "assets/suits/spade.svg"),

  // asset - card value
  kingCard(path: "assets/images/king.png"),
  queenCard(path: "assets/images/queen.png"),
  jackCard(path: "assets/images/jack.png"),

  // asset - fontfamily
  cardFontFamily(path: "BebasNeue"),
  mainFontFamily(path: "Gluten");

  const AssetsConstance({required this.path});
  final String path;
}
