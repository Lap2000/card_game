import 'package:card_game/app/utils/shared_preference_util.dart';

import 'app_preferences_keys.dart';

class AppPreferences {
  Future<void> setLanguage(String value) async {
    await SharedPreferencesUtil.setString(
      AppPreferencesKeys.languageKey,
      value,
    );
  }

  Future<String> getLanguage() async {
    final language = await SharedPreferencesUtil.getString(
      AppPreferencesKeys.languageKey,
    );
    return language;
  }
}
