import 'dart:collection';
import 'dart:ui';

import 'package:card_game/app/utils/Localization/st_en_us.dart';
import 'package:card_game/app/utils/Localization/st_vi_vn.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static void changeLocale(Locale localeArg) {
    Get.updateLocale(localeArg);
  }

  static final langCodes = [
    'en',
    'vi',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}

enum Language { ENGLISH, VIETNAMESE }

extension LanguageExt on Language {
  Locale get locale {
    switch (this) {
      case Language.VIETNAMESE:
        return LocalizationService.locales[0];
      case Language.ENGLISH:
        return LocalizationService.locales[1];
    }
  }

  static Locale getLocale(String key) {
    switch (key) {
      case 'vi':
        return LocalizationService.locales[1];
      default:
        return LocalizationService.locales[0];
    }
  }
}
