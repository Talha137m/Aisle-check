import 'package:aislecheck/features/ad_payment/views/ad_payment_page.dart';
import 'package:aislecheck/features/add_inventory/views/add_inventory_page.dart';
import 'package:aislecheck/features/admin_home/controllers/admin_bottom_controller.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/admin_profile/views/admin_profile_page.dart';
import 'package:aislecheck/features/ads/views/ads.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_in_page.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_up_page.dart';
import 'package:aislecheck/features/auth/views/sign_in_page.dart';
import 'package:aislecheck/features/auth/views/sign_up_page.dart';
import 'package:aislecheck/features/browsing_history/views/browsing_history_page.dart';
import 'package:aislecheck/features/choose_role/controllers/choose_role_controller.dart';
import 'package:aislecheck/features/choose_role/views/choose_role_page.dart';
import 'package:aislecheck/features/comapign_data_form/views/compaign_data_form_page.dart';
import 'package:aislecheck/features/edit_inventory/views/edit_inventory_page.dart';
import 'package:aislecheck/features/membership_plan/views/membership_plan_page.dart';
import 'package:aislecheck/features/profile_details/views/profile_details_page.dart';
import 'package:aislecheck/features/schedule_item/controller/date_controller.dart';
import 'package:aislecheck/features/schedule_item/controller/time_picker_controller.dart';
import 'package:aislecheck/features/schedule_item/views/schedule_item_page.dart';
import 'package:aislecheck/features/shopping_items_operations/views/item_operation_page.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/shop_detail/views/shop_details_page.dart';
import 'package:aislecheck/features/shops_map/views/shops_location.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return switch (settings.name) {
    OnBordingPage.name => AnimatedRoutes(
        setting: settings,
        child: OnBordingPage(),
      ),
    ChooseRolePage.name => AnimatedRoutes(
        setting: settings,
        child: MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context) {
              return ChooseRoleController();
            },
          )
        ], child: const ChooseRolePage()),
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
    ShoppingItemOperationPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const ShoppingItemOperationPage(
          listName: 'grossery',
        ),
      ),
    ProfileDeatilsScreen.pageName => AnimatedRoutes(
        setting: settings,
        child: const ProfileDeatilsScreen(),
      ),
    BrowsingHistoryPage.name => AnimatedRoutes(
        setting: settings,
        child: const BrowsingHistoryPage(),
      ),
    ScheduleItemPage.pageName => AnimatedRoutes(
        setting: settings,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => TimePickerController(),
            ),
            ChangeNotifierProvider(
              create: (context) => DateController(),
            )
          ],
          child: const ScheduleItemPage(),
        ),
      ),
    AdminHomePage.pageName => AnimatedRoutes(
        setting: settings,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) {
                return AdminBottomController();
              },
            )
          ],
          child: AdminHomePage(),
        ),
      ),
    EditInventoryPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const EditInventoryPage(),
      ),
    AddInventoryPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const AddInventoryPage(),
      ),
    AdsWidget.pageName => AnimatedRoutes(
        setting: settings,
        child: const AdsWidget(),
      ),
    AdminSignUpPage.name => AnimatedRoutes(
        setting: settings,
        child: const AdminSignUpPage(),
      ),
    AdmminSignInPage.name => AnimatedRoutes(
        setting: settings,
        child: const AdmminSignInPage(),
      ),
    CompaignDataFormPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const CompaignDataFormPage(),
      ),
    AdPaymentPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const AdPaymentPage(),
      ),
    AdminProfilePage.pageName => AnimatedRoutes(
        setting: settings,
        child: const AdminProfilePage(),
      ),
    MemberShipPlanPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const MemberShipPlanPage(),
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

abstract class NavigationState {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
