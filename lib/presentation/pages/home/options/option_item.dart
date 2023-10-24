import 'dart:collection';

import 'package:card_game/app/utils/env/device_info.dart';
import 'package:card_game/presentation/components/text/app_text.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.title,
    required this.content,
    this.iconData,
    this.showDivider = true,
  });

  final String title;
  final Widget content;
  final IconData? iconData;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    List<Shadow> outlinedText(
        {double strokeWidth = 2,
        Color strokeColor = Colors.black,
        int precision = 5}) {
      Set<Shadow> result = HashSet();
      for (int x = 1; x < strokeWidth + precision; x++) {
        for (int y = 1; y < strokeWidth + precision; y++) {
          double offsetX = x.toDouble();
          double offsetY = y.toDouble();
          result.add(Shadow(
              offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
              color: strokeColor));
          result.add(Shadow(
              offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
              color: strokeColor));
          result.add(Shadow(
              offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
              color: strokeColor));
          result.add(Shadow(
              offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
              color: strokeColor));
        }
      }
      return result.toList();
    }

    List<Shadow> shadow = [
      const Shadow(
        color: Colors.black87,
        blurRadius: 1,
        offset: Offset(3, 3),
      ),
      ...outlinedText(strokeWidth: 0.3, strokeColor: Colors.black87),
    ];

    final scale = DeviceInfo().scale();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  iconData ?? Icons.volume_up,
                  color: Colors.green.shade400,
                  size: 30 * scale,
                  shadows: shadow,
                ),
                SizedBox(width: 12 * scale),
                AppText(
                  text: title,
                  color: Colors.green.shade400,
                  shadows: shadow,
                ),
              ],
            ),
            SizedBox(
              width: 140 * scale,
              height: 38 * scale,
              child: content,
            ),
          ],
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * scale),
            child: Divider(thickness: 2 * scale, color: Colors.white12),
          ),
      ],
    );
  }
}
