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

  Future<String?> getAdminUid() async {
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
}
