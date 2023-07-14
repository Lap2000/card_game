import 'package:card_game/ui/pages/load_screen/load_screen_page.dart';
import 'package:card_game/ui/router/routers.dart';
import 'package:card_game/utils/language_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_context/one_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  OnePlatform.app = () => EasyLocalization(
        supportedLocales: languages,
        path: 'assets/translations',
        fallbackLocale: Language.VIETNAMESE.locale,
        child: const MyApp(),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: routers,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      // home: SplashScreen.navigate(
      //   name: 'assets/rive_files/intro.riv',
      //   next: (_) => MyHomePage(title: 'Flutter Demo Home Page'),
      //   until: () => Future.delayed(const Duration(seconds: 0)),
      // ),
      home: const PlashScreenPage(title: 'Flutter Demo Home Page'),
    );
  }
}
