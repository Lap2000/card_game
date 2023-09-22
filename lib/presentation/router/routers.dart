import 'package:card_game/presentation/pages/black_jack/black_jack_page.dart';
import 'package:card_game/presentation/pages/black_jack/black_jack_tables_page.dart';
import 'package:card_game/presentation/pages/home/home_page.dart';
import 'package:card_game/presentation/pages/login/login_page.dart';
import 'package:card_game/presentation/router/pages.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routers = [
  GetPage(
    name: Pages.login.pageName,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: Pages.home.pageName,
    page: () => const HomePage(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: Pages.blackJack.pageName,
    page: () => const BlackJackPage(),
  ),
  GetPage(
    name: Pages.blackJackTables.pageName,
    page: () => const BlackJackTablesPage(),
  ),
];
