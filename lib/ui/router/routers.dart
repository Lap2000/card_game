import 'package:card_game/ui/pages/home/login_page.dart';
import 'package:card_game/ui/router/pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final List<GetPage<dynamic>> routers = [
  GetPage(
    name: Pages.login.pageName,
    page: () => LoginPage(),
  ),
];
