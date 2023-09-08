import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTable extends StatelessWidget {
  const CardTable({
    super.key,
    this.padding = const EdgeInsets.only(top: 20),
    this.isTableFor6People = false,
  });

  final EdgeInsets padding;
  final bool isTableFor6People;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(Pages.blackJack.pageName);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                isTableFor6People
                    ? AssetsConstance.table6Icon.path
                    : AssetsConstance.table4Icon.path,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: isTableFor6People ? 8 : 0),
                child: const Text('3 / 6'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
