import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  //await Firebase.initializeApp();
  //await SharedPreferencesUtil.getInstance();
  //await PackageInfo.fromPlatform();
}
