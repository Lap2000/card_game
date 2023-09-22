import 'package:card_game/app/utils/localization_service_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDialogController extends GetxController {
  static LanguageDialogController get to =>
      Get.find<LanguageDialogController>();

  final RxString selected = ''.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    if (Get.locale != null) {
      setSelected(Get.locale!.languageCode);
    }
    super.onInit();
  }

  void setSelected(String value) {
    selected.value = value;
  }

  int getIndexOfSelectedItem() {
    return LocalizationService.langCodes.indexWhere((e) => e == selected.value);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
