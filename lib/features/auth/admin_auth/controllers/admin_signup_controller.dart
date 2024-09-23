import 'dart:developer';
import 'dart:io';

import 'package:aislecheck/core/services/admin_profile_service.dart';
import 'package:aislecheck/core/services/auth_service.dart';
import 'package:aislecheck/core/services/id_services.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/auth_behaviour.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

sealed class AdminSignupStates {}

class AdminSignUpInitialState extends AdminSignupStates {}

class AdminSignupLoadingState extends AdminSignupStates {}

class AdminSignupErrorgState extends AdminSignupStates {
  final String msg;
  AdminSignupErrorgState({required this.msg});
}

class GoogleSigninLoadedState extends AdminSignupStates {}

class AdminSignupLoadedState extends AdminSignupStates {
  AdminSignupLoadedState();
}

class AdminSignupController extends ChangeNotifier with AuthBehaviour {
  //.....define the states
  AdminSignupStates _state = AdminSignUpInitialState();
  AdminSignupStates get state => _state;

  //method that change the state
  void _setState(AdminSignupStates newState) {
    _state = newState;
    notifyListeners();
  }

  final AdminAuthService _adminAuthService = AdminAuthService();
  final AdminProfileService _adminProfileService = AdminProfileService();
  final IdServices _idServices = IdServices();
  final SessionManageService _sessionManageService = SessionManageService();
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
    _setState(AdminSignupLoadingState());
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
          bool isInsert = await _sessionManageService.insertAdminUid(user!.uid);

          log(isInsert.toString());
          user.updateDisplayName(
            nameController.text.trim(),
          );
          await _adminProfileService.addAdmin(
            AdminModel(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              adminId: user.uid,
              phoneNo: phoneNumberController.text.trim(),
              deviceToken: await _idServices.getDeviceToken(),
            ),
          );
          await _sendEmailVerfication(user);
          _setState(AdminSignupLoadedState());
        case false:
          _setState(AdminSignupErrorgState(
              msg: 'user not found:cannot create account'));
      }
    } on FirebaseAuthException catch (e) {
      var msg = handleAuthException(e.code);
      _setState(AdminSignupErrorgState(msg: msg));
    } on FirebaseException catch (e) {
      log(e.toString());
      _setState(AdminSignupErrorgState(msg: 'Something went wrong'));
    } catch (e) {
      _setState(AdminSignupErrorgState(msg: 'Something went wrong'));
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _setState(AdminSignUpInitialState());
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

  void signInWithGoogle() async {
    try {
      _setState(AdminSignupLoadingState());
      User? user = await _adminAuthService.userGoogleSignIn();
      log(user.toString());
      if (user != null) {
        user.updateDisplayName(user.displayName);
        bool isInsert = await _sessionManageService.insertAdminUid(user.uid);
        log(isInsert.toString());
        await _adminProfileService.addAdmin(
          AdminModel(
            name: user.displayName!,
            email: user.email!,
            adminId: user.uid,
            imageUrl: user.photoURL,
            deviceToken: await _idServices.getDeviceToken(),
          ),
        );
        bool isSignin = await _sessionManageService.insertIsAdminSignedIn(true);
        switch (isSignin) {
          case true:
            _setState(
              GoogleSigninLoadedState(),
            );
          case false:
            _setState(
              AdminSignupErrorgState(msg: 'Something went wrong'),
            );
        }
      } else {
        _setState(
            AdminSignupErrorgState(msg: 'please choose accout one of them'));
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      var msg = handleAuthException(e.code);
      _setState(
        AdminSignupErrorgState(msg: msg),
      );
    }
  }

  void reinitializeState() {
    _setState(AdminSignUpInitialState());
  }

  void signInWithApple() async {
    try {
      _setState(AdminSignupLoadingState());
      await _adminAuthService.appleSignIn();
    } on SocketException catch (e) {
      log(e.toString());
      _setState(AdminSignupErrorgState(msg: 'internet coonection failed!'));
    } catch (e) {
      log(e.toString());
      _setState(AdminSignupErrorgState(msg: 'Something went wrong'));
    }
  }
}
