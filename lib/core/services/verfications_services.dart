import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class VerficationsServices {
  static VerficationsServices? _verficationsServices;
  VerficationsServices._internal();
  factory VerficationsServices() {
    return _verficationsServices ??= VerficationsServices._internal();
  }
  Future<bool> checkEmailVerfication() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload(); // Reload user data
      user = FirebaseAuth.instance.currentUser; // Refresh user object
      if (user!.emailVerified) {
        log("Email is verified");
        // Navigate to the main app screen or perform other actions
        return true;
      } else {
        log("Email is not verified yet");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<String> resendEmailVerfication() async {
    bool isVerfy = await checkEmailVerfication();
    switch (isVerfy) {
      case true:
        throw Exception("Email is verified");
      case false:
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.reload(); // Reload user data
          user = FirebaseAuth.instance.currentUser;
          user?.sendEmailVerification();
          return "Resend Email verfication link";
        } else {
          throw Exception("User is not logged in");
        }
    }
  }
}
