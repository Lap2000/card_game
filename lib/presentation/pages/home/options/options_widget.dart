import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/utils/env/device_info.dart';
import 'package:card_game/presentation/components/button/custom_switch_button/custom_switch_button.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:card_game/presentation/components/text/app_text.dart';
import 'package:card_game/presentation/controllers/home_controller/options_controller.dart';
import 'package:card_game/presentation/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';

import 'option_item.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    this.action,
  });

  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    Get.put(OptionsController());
    final controller = OptionsController.to;
    final scale = DeviceInfo().scale();

    return Container(
      height: 300 * DeviceInfo().scale(),
      width: 450 * DeviceInfo().scale(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsConstance.mainFormImage.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15 * (scale + (scale - 1) * 5 / 2) -
                (scale + (scale - 1) * 40 / 2),
            right: 15 * (scale + (scale - 1) * 5 / 2) -
                (scale + (scale - 1) * 40 / 2),
            child: CustomImageButton(
              path: AssetsConstance.cancelIcon.path,
              action: action,
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 220 * DeviceInfo().scale(),
              width: 350 * DeviceInfo().scale(),
              child: ListView(
                children: [
                  const SizedBox(height: 5),
                  // Notifications
                  OptionItem(
                    title: 'Profile',
                    iconData: Icons.person,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageButton(
                          padding: const EdgeInsets.only(right: 15),
                          path: AssetsConstance.nextIcon.path,
                          size: 30,
                          action: () {
                            Get.toNamed(Pages.blackJackTables.pageName);
                          },
                        ),
                      ],
                    ),
                  ),
                  // Volume
                  OptionItem(
                    title: 'Volume',
                    content: Obx(
                      () => FlutterSlider(
                        values: [controller.volumeValue.value],
                        max: 100,
                        min: 0,
                        tooltip: FlutterSliderTooltip(
                          custom: (value) {
                            return AppText(text: value.toInt().toString());
                          },
                        ),
                        trackBar: FlutterSliderTrackBar(
                          inactiveTrackBarHeight: 4 * scale,
                          activeTrackBarHeight: 6 * scale,
                          inactiveTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black45,
                          ),
                          activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green.withOpacity(0.8),
                          ),
                        ),
                        visibleTouchArea: false,
                        selectByTap: false,
                        handler: FlutterSliderHandler(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Container(
                            width: 25 * scale,
                            height: 25 * scale,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    AssetsConstance.unMutedIcon.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Notifications
                  const OptionItem(
                    title: 'Notifications',
                    iconData: Icons.notifications_active,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomSwitchButton(),
                      ],
                    ),
                  ),
                  const OptionItem(
                    title: 'Vibrate',
                    iconData: Icons.vibration,
                    showDivider: false,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomSwitchButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
