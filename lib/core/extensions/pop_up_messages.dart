import 'package:aislecheck/core/common/widgets/fade_slide_animation.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

extension PopUpMessages on BuildContext {
// =======show dialog for add
//========and update item

  void addItemDialog({required Widget child}) {
    showGeneralDialog(
      context: this,
      anchorPoint: const Offset(0.5, 0.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeAndSlideAnimation(
          fadeAnimation: animation,
          slideAnimation: animation.drive(
            Tween(begin: const Offset(0, -0.2), end: Offset.zero),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          actions: [child],
        );
      },
    );
  }

  // =======create the function show
  // ====== that show messages
  showPopUpMsg(String message, {int seconds = 1}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppColors.greenColor,
          content: Text(
            message,
          ),
          duration: Duration(
            seconds: seconds,
          ),
          showCloseIcon: true,
        ),
      );
  }

  //.....create the loading pop
  void loadingPopUp() {
    showDialog(
      context: this,
      builder: (context) {
        return const AlertDialog(
          actions: [
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }
}
