import 'package:aislecheck/features/auth/views/sign_in_page.dart';
import 'package:aislecheck/features/auth/views/widgets/sign_up_page.dart';
import 'package:aislecheck/features/choose_role/views/choose_role_page.dart';
import 'package:aislecheck/features/list_overview/views/list_overview_page.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/shop_detail/views/shop_details_page.dart';
import 'package:aislecheck/features/shops_map/views/shops_location.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return switch (settings.name) {
    OnBordingPage.name => AnimatedRoutes(
        setting: settings,
        child: OnBordingPage(),
      ),
    ChooseRolePage.name => AnimatedRoutes(
        setting: settings,
        child: const ChooseRolePage(),
      ),
    SignUpPage.name => AnimatedRoutes(
        setting: settings,
        child: const SignUpPage(),
      ),
    SignInPage.name => AnimatedRoutes(
        setting: settings,
        child: const SignInPage(),
      ),
    UserHomePage.name => AnimatedRoutes(
        setting: settings,
        child: UserHomePage(),
      ),
    ShopDetailsPage.name => AnimatedRoutes(
        setting: settings,
        child: const ShopDetailsPage(),
      ),
    ShopsLocation.name => AnimatedRoutes(
        setting: settings,
        child: const ShopsLocation(),
      ),
    ListOverveiwPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const ListOverveiwPage(
          listName: 'grossery',
        ),
      ),
    _ => AnimatedRoutes(
        setting: settings,
        child: Container(
          color: Colors.red,
          child: const Center(
            child: Text('404! page not found'),
          ),
        ),
      ),
  };
}

//create the class for slide transition
class AnimatedRoutes extends PageRouteBuilder {
  final Widget child;
  final RouteSettings? setting;
  static Tween<Offset> tween =
      Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);

  AnimatedRoutes({required this.child, this.setting})
      : super(
          settings: setting,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: tween.animate(animation),
              child: child,
            );
          },
        );
}
