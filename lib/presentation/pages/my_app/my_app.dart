import 'package:card_game/app/utils/localization_service_util.dart';
import 'package:card_game/presentation/pages/load_screen/load_screen_page.dart';
import 'package:card_game/presentation/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_context/one_context.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Card Game',
      getPages: routers,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      // home: SplashScreen.navigate(
      //   name: 'assets/rive_files/intro.riv',
      //   next: (_) => const LoginPage(),
      //   until: () => Future.delayed(const Duration(seconds: 0)),
      // ),
      home: const PlashScreenPage(),
    );
  }
}
