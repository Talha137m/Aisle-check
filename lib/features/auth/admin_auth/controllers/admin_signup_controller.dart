import 'dart:developer';

import 'package:aislecheck/core/services/auth_service.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/auth_behaviour.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class AdminSignupController extends ChangeNotifier with AuthBehaviour {
  //.....define the states
  bool initialState = true;
  bool loadingState = false;
  bool dataSate = false;
  bool errorState = false;
  String errorMessage = 'Something went wrong';

  final AdminAuthService _adminAuthService = AdminAuthService();
  //...constants
  static const _confirmPasswordErrorMsg = 'Password should match';
  static const _emptyNameFieldErrormsg = 'field should not empty';
  //...CONTROLLERS
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  //....FORM VALIDATION KEY
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AdminSignupController() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  String? emailValidation(String? value) {
    const validator = EmailValidator();
    return validator.validate(label: 'Email', value: value);
  }

  String? phoneNumberValidation(String? value) {
    const validator = PhoneNumberValidator();
    return validator.validate(label: 'Phone number', value: value);
  }

  String? confrimPasswordValidation(String? value) {
    if (confirmPasswordController.text == passwordController.text) {
      return null;
    } else {
      return _confirmPasswordErrorMsg;
    }
  }

  String? isEmptyForm(String? value) {
    if (value != null) {
      return null;
    } else {
      return _emptyNameFieldErrormsg;
    }
  }

  void createUser() async {
    notifyListeners();
    initialState = false;
    loadingState = true;
    notifyListeners();
    try {
      User? user = await _adminAuthService.userRegister(
        adminAuthModel: AdminSignUpModel(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phoneNo: phoneNumberController.text.trim(),
            password: passwordController.text.trim()),
      );

      switch (user != null) {
        case true:
          bool isVerfy = await _sendEmailVerfication(user!);
          switch (isVerfy) {
            case true:
              user.updateDisplayName(nameController.text.trim());
              initialState = false;
              loadingState = false;
              dataSate = true;
            case false:
              initialState = false;
              loadingState = false;
              dataSate = false;
              errorState = true;
              errorMessage =
                  'please open your email account for email verfication!';
          }

        case false:
          initialState = false;
          loadingState = false;
          dataSate = false;
          errorState = true;
          errorMessage = 'user not found:cannot create account';
      }
    } on FirebaseAuthException catch (e) {
      initialState = false;
      loadingState = false;
      dataSate = false;
      errorState = true;
      var msg = handleAuthException(e.code);
      errorMessage = msg;
    } on FirebaseException catch (e) {
      initialState = false;
      loadingState = false;
      dataSate = false;
      errorState = true;
      log(e.toString());
    } catch (e) {
      initialState = false;
      loadingState = false;
      dataSate = false;
      errorState = true;
      log(e.toString());
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  Future<bool> _sendEmailVerfication(User user) async {
    await user.sendEmailVerification();
    return switch (user.emailVerified) {
      true => true,
      false => false,
    };
  }
}
