import 'package:card_game/presentation/components/dialog/base_dialog.dart';
import 'package:card_game/presentation/components/dialog/language_dialog.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class DialogUtil {
  // Show language dialog
  static Future<void> showLanguageDialog() async {
    await OneContext().showDialog<int>(
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LanguageDialog();
      },
    );
  }

  // Show confirm dialog
  static Future<void> showConfirmDialog(
    BuildContext context, {
    String? title,
    String? message,
    VoidCallback? confirmAction,
  }) async {
    showGeneralDialog(
      context: context,
      barrierLabel: "ImageBackground",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (ctx, __, ___) {
        return BaseDialog(
          dialogContext: ctx,
          title: title,
          message: message,
          confirmAction: confirmAction,
          scale: 1.2,
        );
      },
      transitionBuilder: (_, animation, ___, child) {
        // // Custom animation tween
        // Tween<Offset> tween;
        // if (animation.status == AnimationStatus.reverse) {
        //   tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        // } else {
        //   tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        // }

        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInCubic,
            reverseCurve: Curves.easeInCubic,
          ),
          child: child,
        );

        // // Animation slide transition
        // return SlideTransition(
        //   position: tween.animate(animation),
        //   child: FadeTransition(
        //     opacity: animationScale,
        //     child: child,
        //   ),
        // );
      },
    );
  }
}
