import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app/utils/localization_service_util.dart';
import 'app/utils/shared_preference_util.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  //await Firebase.initializeApp();
  //await SharedPreferencesUtil.getInstance();
  //await PackageInfo.fromPlatform();
  await SharedPreferencesUtil.init();
  await LocalizationService.getLanguageFromAppPreferences();
}
