import 'dart:ui';

final List<Locale> languages = [
  const Locale('vi', 'VI'),
  const Locale('en', 'US'),
];

enum Language { ENGLISH, VIETNAMESE }

extension LanguageExt on Language {
  Locale get locale {
    switch (this) {
      case Language.VIETNAMESE:
        return languages[0];
      case Language.ENGLISH:
        return languages[1];
    }
  }

  // String get name {
  //   switch (this) {
  //     case Language.ENGLISH:
  //       return LocaleKeys.english.tr();
  //     case Language.JAPANESE:
  //       return LocaleKeys.japanese.tr();
  //   }
  // }
}
