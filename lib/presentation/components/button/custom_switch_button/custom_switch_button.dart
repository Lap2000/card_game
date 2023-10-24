import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/app/utils/env/device_info.dart';
import 'package:card_game/presentation/components/button/image_button/custom_image_button/custom_image_button.dart';
import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({
    super.key,
    this.padding = const EdgeInsets.only(right: 20),
    this.action,
  });

  final EdgeInsets padding;
  final VoidCallback? action;

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isOn = false;

  void setIsOn() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: setIsOn,
      child: Container(
        padding: isOn
            ? const EdgeInsets.only(right: 1)
            : const EdgeInsets.only(left: 1),
        height: 32 * DeviceInfo().scale(),
        width: 55 * DeviceInfo().scale(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isOn ? Colors.green.withOpacity(0.7) : Colors.black45,
          border: Border.all(
            width: 0.5,
          ),
        ),
        margin: widget.padding,
        child: AnimatedAlign(
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: CustomImageButton(
            path: AssetsConstance.moreOptionsIcon.path,
            size: 30,
            action: setIsOn,
          ),
        ),
      ),
    );
  }
}
