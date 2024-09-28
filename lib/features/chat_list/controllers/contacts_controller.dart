import 'dart:developer';

import 'package:aislecheck/core/services/admin_profile_service.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:flutter/material.dart';

//....CONTACTS STATE
@immutable
sealed class ContactsState {}

@immutable
final class ContactsLoading extends ContactsState {}

@immutable
final class ContactsLoaded extends ContactsState {
  final List<AdminModel> admins;
  ContactsLoaded({required this.admins});
}

@immutable
final class ContactsError extends ContactsState {
  final String message;
  ContactsError(this.message);
}

//....CONTACTS CONTROLLER
class ContactsController extends ChangeNotifier {
  ContactsState _state = ContactsLoading();
  ContactsState get state => _state;
  _setState(ContactsState contactsState) {
    _state = contactsState;
    notifyListeners();
  }
  ContactsController() {
    getAllContacts();
  }
  //....initialize the services
  final AdminProfileService _adminProfileService = AdminProfileService();
  void getAllContacts() async {
    _setState(ContactsLoading());
    try {
      List<AdminModel> admins = await _adminProfileService.getAdmin();
      //....
      _setState(ContactsLoaded(admins: admins));
      
    } catch (e) {
      log(e.toString());
      _setState(ContactsError('something went wrong'));
    }
  }
}
