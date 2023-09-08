import 'package:card_game/presentation/pages/my_app/my_app.dart';
import 'package:one_context/one_context.dart';

import 'initialize.dart';

void main() async {
  await initialize();
  OnePlatform.app = () => const MyApp();
}
