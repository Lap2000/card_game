import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/utils/Localization/localkeys.dart';
import 'package:card_game/app/utils/env/tablet_info.dart';
import 'package:card_game/app/utils/localization_service_util.dart';
import 'package:card_game/presentation/controllers/dialog_controller/language_dialog_controller.dart';
import 'package:card_game/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_dialog.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageDialogController());
    Get.put(LoginController());
    final controller = LanguageDialogController.to;
    final loginController = LoginController.to;
    final languagesCount = LocalizationService.langCodes.length;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.scrollController.animateTo(
        controller.scrollController.position.maxScrollExtent /
            (languagesCount - 1) *
            controller.getIndexOfSelectedItem(),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    });

    bool isTablet = TabletInfo().isTablet();
    final height = isTablet ? Get.width : Get.height;
    final scaleDialog = height / 864;

    return BaseDialog(
      scale: 1.5 * scaleDialog,
      dialogContext: context,
      title: LocaleKeys.lang.tr,
      confirmAction: () {
        LocalizationService.changeLocale(
            LanguageExt.getLocale(controller.selected.value));
        loginController.refreshAppBarTitle();
      },
      content: SizedBox(
        height: 150 * scaleDialog,
        child: ListWheelScrollView(
          controller: controller.scrollController,
          itemExtent: 30,
          diameterRatio: 0.8,
          physics: const ScrollPhysics(),
          onSelectedItemChanged: (index) {
            print('index : $index');
            controller.setSelected(LocalizationService.langCodes[index]);
          },
          children:
              List.generate(LocalizationService.langCodes.length, (index) {
            final key = LocalizationService.langCodes[index];
            return Obx(
              () => InkWell(
                onTap: () {
                  controller.selected(key);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(
                        controller.selected.value == key
                            ? AssetsConstance.selectedBackground.path
                            : AssetsConstance.unselectedBackground.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    LanguageExt.getTitle(key),
                    style: TextStyle(
                      fontSize: 14 * scaleDialog,
                      color: controller.selected.value == key
                          ? AppColors.black.color
                          : AppColors.white.color,
                      fontFamily: AssetsConstance.mainFontFamily.path,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
