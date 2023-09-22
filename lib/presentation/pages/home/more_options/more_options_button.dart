import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:card_game/presentation/controllers/home_controller/more_options_controller/more_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MoreOptionsController());
    final controller = MoreOptionsController.to;
    return Container(
      width: 60,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedBuilder(
            animation: controller.animationController.view,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, controller.transAnimation1.value),
                child: Obx(() {
                  return Visibility(
                    visible: !controller.isShowing.value
                        ? (controller.isHiding.value)
                        : controller.isShowing.value,
                    child: CustomImageButton(
                      path: AssetsConstance.moreInfoIcon.path,
                      padding: const EdgeInsets.only(bottom: 6),
                      action: () {},
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedBuilder(
            animation: controller.animationController.view,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, controller.transAnimation2.value),
                child: Obx(
                  () => Visibility(
                    visible: !controller.isShowing.value
                        ? (controller.isHiding.value)
                        : controller.isShowing.value,
                    child: CustomImageButton(
                      path: AssetsConstance.settingsIcon.path,
                      padding: const EdgeInsets.only(bottom: 6),
                      action: () {},
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: controller.animationController.view,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, controller.transAnimation3.value),
                child: Obx(
                  () => Visibility(
                    visible: !controller.isShowing.value
                        ? (controller.isHiding.value)
                        : controller.isShowing.value,
                    child: CustomImageButton(
                      path: AssetsConstance.switchIcon.path,
                      padding: const EdgeInsets.only(bottom: 0),
                      action: () {},
                    ),
                  ),
                ),
              );
            },
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 20,
                child: Visibility(
                  visible: !controller.isShowing.value
                      ? (controller.isHiding.value)
                      : controller.isShowing.value,
                  child: const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => CustomImageButton(
              path: controller.isShowing.value
                  ? AssetsConstance.downloadIcon.path
                  : AssetsConstance.moreOptionsIcon.path,
              padding: const EdgeInsets.only(bottom: 6),
              action: () {
                if (controller.animationStatus == AnimationStatus.completed ||
                    controller.animationStatus == AnimationStatus.dismissed) {
                  controller.callAnimation();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
