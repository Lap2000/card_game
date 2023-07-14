import 'package:card_game/gen/locale_keys.g.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  RxString appBarTitle = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appBarTitle.value = LocaleKeys.loginTitle.tr;
  }

  void refreshAppBarTitle() {
    appBarTitle.value = LocaleKeys.loginTitle.tr;
  }
}
