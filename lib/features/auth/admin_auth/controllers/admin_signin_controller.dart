import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/constants/strings/keys.dart';
import 'package:aislecheck/core/services/auth_service.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSigninController extends ChangeNotifier {
  final AdminAuthService _adminAuthService = AdminAuthService();
  //.....define the states
  bool initialState = true;
  bool loadingState = false;
  bool dataSate = false;
  bool errorState = false;
  String errorMessage = 'Something went wrong';
  //...CONTROLLERS
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AdminSigninController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void signIn() async {
    notifyListeners();
    initialState = false;
    loadingState = true;
    notifyListeners();
    User? user = await _adminAuthService.userSigin(
      adminAuthModel: AdminSigninModel(
        email: emailController.text.trim(),
        password: emailController.text.trim(),
      ),
    );
    switch (user != null) {
      case true:
      insertUserId(user!.uid);
      
      case false:
    }
  }

  void insertUserId(String userId) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    await sharedPreferences.setBool(Keys.isAdminLogin, true);
    await sharedPreferences.setString(Keys.adminUID, userId);
  }
}
