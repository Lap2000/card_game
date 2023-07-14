import 'package:card_game/ui/controllers/login_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_context/one_context.dart';

import 'language_util.dart';

class DialogUtil {
  static Future<void> showLanguageDialog() async {
    Get.put(LoginController());
    final controller = LoginController.to;
    await OneContext().showDialog<int>(
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: const Text('Select language'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  context.setLocale(Language.VIETNAMESE.locale);
                  controller.refreshAppBarTitle();
                  OneContext().popDialog();
                },
                child: const Text('Vietnamese'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  context.setLocale(Language.ENGLISH.locale);
                  controller.refreshAppBarTitle();
                  OneContext().popDialog();
                },
                child: const Text('English'),
              ),
            ],
          );
        });
  }
}
