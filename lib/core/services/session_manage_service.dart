import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/constants/strings/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManageService {
  static SessionManageService? _sessionManageService;
  SessionManageService._internal();
  factory SessionManageService() {
    return _sessionManageService ??= SessionManageService._internal();
  }
  Future<bool> insertAdminUid(String uid) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool isInsert = await sharedPreferences.setString(Keys.adminUID, uid);
    return isInsert;
  }

  String? getAdminUid() {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    String? uid = sharedPreferences.getString(Keys.adminUID);
    return uid;
  }

  Future<bool> insertIsAdminSignedIn(bool isAdminSignedIn) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool isSingned =
        await sharedPreferences.setBool(Keys.isAdminLogin, isAdminSignedIn);
    return isSingned;
  }

  Future<bool?> isAdminSignedIn() async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool? isSingned = sharedPreferences.getBool(Keys.isAdminLogin);
    return isSingned;
  }

  Future<bool> insertIsUserSignedIn(bool isUserSignin) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool isSingned =
        await sharedPreferences.setBool(Keys.isUserSignin, isUserSignin);
    return isSingned;
  }

  Future<bool?> isUserSignedIn() async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool? isSingned = sharedPreferences.getBool(Keys.isUserSignin);
    return isSingned;
  }

  Future<bool> insertIsShopRegister(bool isShopRegister) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool registerShop =
        await sharedPreferences.setBool(Keys.isShopRegister, isShopRegister);
    return registerShop;
  }

  Future<bool?> isShopRegister() async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool? isShopRegister = sharedPreferences.getBool(Keys.isShopRegister);
    return isShopRegister;
  }

  Future<bool> insertAdminChooseRole(bool isAdminrole) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool isAdminChooseRole =
        await sharedPreferences.setBool(Keys.isAdminChooseRole, isAdminrole);
    return isAdminChooseRole;
  }

  Future<bool?> isAdminChooseRole() async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool? isAdminChooseRole = sharedPreferences.getBool(Keys.isAdminChooseRole);
    return isAdminChooseRole;
  }

  Future<bool> insertUserChooseRole(bool isUserRole) async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool isUserChooseRole =
        await sharedPreferences.setBool(Keys.isUserChooseRole, isUserRole);
    return isUserChooseRole;
  }

  Future<bool?> isUserChooseRole() async {
    SharedPreferences sharedPreferences = locator.get<SharedPreferences>();
    bool? isUserChooseRole = sharedPreferences.getBool(Keys.isUserChooseRole);
    return isUserChooseRole;
  }
}
