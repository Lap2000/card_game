import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  RxString appBarTitle = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appBarTitle.value = 'login'.tr;
  }

  void refreshAppBarTitle() {
    appBarTitle.value = 'login'.tr;
  }
}
