import 'package:get/get.dart';

class OptionsController extends GetxController
    with GetTickerProviderStateMixin {
  static OptionsController get to => Get.find<OptionsController>();

  // var : slider
  RxDouble volumeValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
