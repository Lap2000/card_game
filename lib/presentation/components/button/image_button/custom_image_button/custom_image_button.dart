import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    this.padding = const EdgeInsets.only(top: 0),
    this.size = 40,
    this.action,
    required this.path,
  });

  final EdgeInsets padding;
  final double size;
  final VoidCallback? action;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: action ?? Get.back,
        child: Image.asset(
          path,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
