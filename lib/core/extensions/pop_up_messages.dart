import 'package:aislecheck/core/common/widgets/fade_slide_animation.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

extension PopUpMessages on BuildContext {
// =======show dialog for add
//========and update item

  void addItemDialog({required Widget child}) {
    if (!mounted) return;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
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
      },
    );
  }

  //.....create the loading pop
  void showLoadingDialog() {
    if (!mounted) return;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
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
            return const Dialog(
              backgroundColor: Colors
                  .transparent, // Makes the background of the dialog transparent
              child: Center(
                child: CircularProgressIndicator(), // Loading spinner
              ),
            );
          },
        );
      },
    );
  }

  void showMessageDialog(String title, String message) {
    if (!mounted) return;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
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
              title: Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ), // Title of the dialog
              content: Text(
                message,
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ), // Message content
              actions: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(AppColors.greenColor),
                  ),
                  child: Text(
                    "OK",
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    Navigator.of(this).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void hideLoadingDialog() {
    SchedulerBinding.instance.addPersistentFrameCallback(
      (timeStamp) {
        if (!mounted) return;
        Navigator.of(this).pop();
      },
    );
  }

  // =======create the function show
  // ====== that show messages
  showPopUpMsg(String message, {int seconds = 5}) {
    if (!mounted) return;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
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
      },
    );
  }
}
