import 'package:card_game/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_context/one_context.dart';

import 'localization_service_util.dart';

class DialogUtil {
  static Future<void> showLanguageDialog() async {
    Get.put(LoginController());
    final controller = LoginController.to;

    List<Widget> buildLanguagesList() {
      var list = <Widget>[];
      LocalizationService.langs.forEach((key, value) {
        list.add(
          SimpleDialogOption(
            onPressed: () {
              LocalizationService.changeLocale(LanguageExt.getLocale(key));
              controller.refreshAppBarTitle();
              OneContext().popDialog();
            },
            child: Text(value),
          ),
        );
      });
      return list;
    }

    await OneContext().showDialog<int>(
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: const Text('Select language'),
          children: buildLanguagesList(),
        );
      },
    );
  }

  static Future<void> showGetBackDialog() async {
    await OneContext().showDialog<int>(
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Do you want to leave?"),
          actions: [
            TextButton(
              onPressed: OneContext().popDialog,
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                OneContext().popDialog();
                Get.back();
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
