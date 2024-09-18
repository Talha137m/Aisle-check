import 'dart:developer';

import 'package:aislecheck/features/auth/admin_auth/models/admin_signin_model.dart';
import 'package:aislecheck/features/auth/admin_auth/models/admin_signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
    log('email:${adminAuthModel.email.toString()} password:${adminAuthModel.password.toString()}');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
            email: adminAuthModel.email, password: adminAuthModel.password);
    return userCredential.user;
  }

  Future<User?> userGoogleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    } else {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      return user;
    }
  }

  Future<void> appleSignIn() async{
   AuthorizationCredentialAppleID credentials= await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);
    log(credentials.toString());
  }
}
