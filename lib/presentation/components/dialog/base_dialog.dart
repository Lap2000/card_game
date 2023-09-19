import 'package:card_game/app/config/const/app_colors.dart';
import 'package:card_game/app/config/const/assets_const.dart';
import 'package:card_game/presentation/components/button/image_button/cancel_button.dart';
import 'package:card_game/presentation/components/button/image_button/confirm_button.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.message,
    this.confirmAction,
    this.content,
    this.scale = 1.0,
    required this.dialogContext,
  });

  final String? title;
  final String? message;
  final VoidCallback? confirmAction;
  final Widget? content;
  final BuildContext dialogContext;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 160 * scale,
        width: 280 * scale,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              // borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(AssetsConstance.dialogBackground.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: 65 * scale,
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      title ?? 'Get back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * scale,
                        color: Colors.amber,
                        fontFamily: AssetsConstance.mainFontFamily.path,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    height: 100 * scale,
                    width: 220 * scale,
                    child: content ??
                        Text(
                          message ??
                              'What the hell? Why do you touch me? Don\'t touch me again!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16 * scale,
                            color: AppColors.white.color,
                            fontFamily: AssetsConstance.mainFontFamily.path,
                            height: 1.2,
                          ),
                        ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 280 * scale,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Transform.scale(
                          scale: scale >= 1.6 ? scale - 0.6 : 1.0,
                          child: CancelButton(
                            cancelAction: Navigator.of(dialogContext).pop,
                          ),
                        ),
                        Transform.scale(
                          scale: scale >= 1.6 ? scale - 0.6 : 1.0,
                          child: ConfirmButton(
                            confirmAction: () {
                              Navigator.of(dialogContext).pop();
                              final callAction = confirmAction ?? () {};
                              callAction();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
