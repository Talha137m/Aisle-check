import 'dart:developer';
import 'package:aislecheck/core/services/admin_profile_service.dart';
import 'package:aislecheck/core/services/auth_service.dart';
import 'package:aislecheck/core/services/id_services.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/auth_behaviour.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

//.....define the states
sealed class AdminSigninState {}

class AdminSigninInitialState implements AdminSigninState {}

class AdminSigninLoadedState implements AdminSigninState {}

class AdminSigninLoadingState implements AdminSigninState {}

class AdminSigninErrorState implements AdminSigninState {
  final String errorMessage;
  AdminSigninErrorState({required this.errorMessage});
}

class AdminSigninController extends ChangeNotifier with AuthBehaviour {
  //.....define the states
  AdminSigninState _state = AdminSigninInitialState();
  AdminSigninState get state => _state;

  //method that change the state
  void _setState(AdminSigninState newState) {
    _state = newState;
    notifyListeners();
  }

  //...services
  final AdminAuthService _adminAuthService = AdminAuthService();
  final SessionManageService _sessionManageService = SessionManageService();
  final AdminProfileService _adminProfileService = AdminProfileService();
  final IdServices _idServices = IdServices();
  //......show error message to the user
  final String _errorMessage = 'Something went wrong';
  static const _emptyNameFieldErrormsg = 'field should not empty';
  //...CONTROLLERS
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AdminSigninController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? emailValidation(String? value) {
    const validator = EmailValidator();
    return validator.validate(label: 'Email', value: value);
  }

  String? isEmptyForm(String? value) {
    if (value != null) {
      return null;
    } else {
      return _emptyNameFieldErrormsg;
    }
  }

  void signIn() async {
    try {
      _setState(AdminSigninLoadingState());
      await _adminAuthService.userSigin(
        adminAuthModel: AdminSigninModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
      _setState(AdminSigninLoadedState());
    } on FirebaseAuthException catch (e) {
      var msg = handleAuthException(e.code);
      _setState(AdminSigninErrorState(errorMessage: msg));
    } on FirebaseException catch (e) {
      log(e.toString());
      _setState(AdminSigninErrorState(errorMessage: _errorMessage));
    } catch (e) {
      _setState(AdminSigninErrorState(errorMessage: _errorMessage));
      log(e.toString());
    }
  }

  void adminGoogleSignIn() async {
    try {
      _setState(AdminSigninLoadingState());
      User? user = await _adminAuthService.userGoogleSignIn();

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
        _setState(
          AdminSigninLoadedState(),
        );
      } else {
        AdminSigninErrorState(errorMessage: 'please choose accout one of them');
      }
    } on FirebaseAuthException catch (e) {
      var msg = handleAuthException(e.code);
      _setState(AdminSigninErrorState(errorMessage: msg));
    } on FirebaseException catch (e) {
      log(e.toString());
      _setState(AdminSigninErrorState(errorMessage: _errorMessage));
    } catch (e) {
      _setState(AdminSigninErrorState(errorMessage: _errorMessage));
      log(e.toString());
    }
  }

  void reinitializeState() {
    _setState(AdminSigninInitialState());
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
