import 'package:card_game/presentation/pages/black_jack/black_jack_page.dart';
import 'package:card_game/presentation/pages/black_jack/black_jack_tables_page.dart';
import 'package:card_game/presentation/pages/home/home_page.dart';
import 'package:card_game/presentation/pages/login/login_page.dart';
import 'package:card_game/presentation/router/pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final List<GetPage<dynamic>> routers = [
  GetPage(
    name: Pages.login.pageName,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: Pages.home.pageName,
    page: () => const HomePage(),
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
