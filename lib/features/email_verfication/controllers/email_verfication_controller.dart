import 'dart:io';

import 'package:aislecheck/core/services/verfications_services.dart';
import 'package:flutter/material.dart';

//....hetre is defiones the sates
@immutable
sealed class EmailVerficationState {}

@immutable
class EmailInitialState extends EmailVerficationState {}

@immutable
class EmialLoadingState extends EmailVerficationState {}

@immutable
class EmailVerficationLoadedState extends EmailVerficationState {}

@immutable
class EmailVerficationErrorState extends EmailVerficationState {
  final String msg;
  EmailVerficationErrorState({required this.msg});
}

//...here the change notifier class
class EmailVerficationController extends ChangeNotifier {
  //...here is the logic ti change the state
  EmailVerficationState _state = EmailInitialState();
  EmailVerficationState get state => _state;
  void _setState(EmailVerficationState newState) {
    _state = newState;
    notifyListeners();
  }

  //...here is the services objects
  final VerficationsServices _verficationsServices = VerficationsServices();

  void verficationEmail() async {
    try {
      bool isVerfy = await _verficationsServices.checkEmailVerfication();
      switch (isVerfy) {
        case true:
          _setState(EmailVerficationLoadedState());
        case false:
          _setState(EmailVerficationErrorState(
              msg: 'Please first verify your email!'));
      }
    } on SocketException {
      _setState(EmailVerficationErrorState(msg: 'Not connected to internet'));
    } catch (e) {
      _setState(EmailVerficationErrorState(msg: 'Something went wrong'));
    }
  }

  void reinitializeState() {
    _setState(EmailInitialState());
  }
}
