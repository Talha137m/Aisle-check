import 'package:aislecheck/features/auth/admin_auth/models/admin_signin_model.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminAuthService {
  static AdminAuthService? _authService;
  AdminAuthService._internal();
  factory AdminAuthService() {
    return _authService ??= AdminAuthService._internal();
  }
  Future<User?> userRegister({required AdminSignUpModel adminAuthModel}) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
            email: adminAuthModel.email, password: adminAuthModel.password);
    return userCredential.user;
  }

  Future<User?> userSigin({required AdminSigninModel adminAuthModel}) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
            email: adminAuthModel.email, password: adminAuthModel.password);
    return userCredential.user;
  }
}
