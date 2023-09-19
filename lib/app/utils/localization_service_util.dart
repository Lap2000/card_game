import 'dart:collection';
import 'dart:ui';

import 'package:card_game/app/utils/Localization/st_en_us.dart';
import 'package:card_game/app/utils/Localization/st_vi_vn.dart';
import 'package:card_game/app/utils/validate_util.dart';
import 'package:card_game/infrastructure/data_sources/app_preferences/app_preferences.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  static Locale? locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static void changeLocale(Locale localeArg) {
    AppPreferences().setLanguage(localeArg.languageCode);
    Get.updateLocale(localeArg);
  }

  static final langCodes = [
    'vi',
    'en',
    'ja',
    'zh',
    'ko',
    'fr',
    'it',
  ];

  static final locales = [
    const Locale('vi', 'VN'),
    const Locale('en', 'US'),
    const Locale('ja', 'JP'),
    const Locale('zh', 'CN'),
    const Locale('ko', 'KR'),
    const Locale('fr', 'FR'),
    const Locale('it', 'IT'),
  ];

  static final langs = LinkedHashMap.from({
    'vi': 'Tiếng Việt',
    'en': 'English',
    'ja': 'Japanese',
    'zh': 'Chinese',
    'ko': 'Korean',
    'fr': 'French',
    'it': 'Italian',
  });

  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi,
        'en_US': en,
        // 'ja_JP': ja,
      };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }

  static Future<void> getLanguageFromAppPreferences() async {
    final localeCode = await AppPreferences().getLanguage();
    if (ValidateString.isEmptyString(localeCode)) {
      return;
    } else {
      locale = LanguageExt.getLocale(localeCode);
      Get.updateLocale(LanguageExt.getLocale(localeCode));
    }
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
        return LocalizationService.locales[0];
      default:
        return LocalizationService.locales[1];
    }
  }

  static String getTitle(String key) {
    switch (key) {
      case 'vi':
        return 'Việt Nam';
      case 'ja':
        return 'Japanese (not supported)';
      case 'zh':
        return 'Chinese (not supported)';
      case 'ko':
        return 'Korean (not supported)';
      case 'fr':
        return 'French (not supported)';
      case 'it':
        return 'Italian (not supported)';
      default:
        return 'English';
    }
  }
}
