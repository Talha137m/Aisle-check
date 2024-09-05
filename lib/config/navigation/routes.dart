import 'package:aislecheck/features/ad_payment/views/ad_payment_page.dart';
import 'package:aislecheck/features/add_inventory/views/add_inventory_page.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/admin_profile/views/admin_profile_page.dart';
import 'package:aislecheck/features/ads/views/ads.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/admin_signup_controller.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/password_field_visibility.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_in_page.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_up_page.dart';
import 'package:aislecheck/features/auth/views/sign_in_page.dart';
import 'package:aislecheck/features/auth/views/sign_up_page.dart';
import 'package:aislecheck/features/boost/views/boost_page.dart';
import 'package:aislecheck/features/boost_products/views/boost_product_page.dart';
import 'package:aislecheck/features/boost_store/views/boost_store_page.dart';
import 'package:aislecheck/features/browsing_history/views/browsing_history_page.dart';
import 'package:aislecheck/features/cancellation_survey/views/cancellation_survey_page.dart';
import 'package:aislecheck/features/choose_role/views/choose_role_page.dart';
import 'package:aislecheck/features/create_new_ads/views/create_ads_page.dart';
import 'package:aislecheck/features/customer_support/views/customer_support_page.dart';
import 'package:aislecheck/features/edit_inventory/views/edit_inventory_page.dart';
import 'package:aislecheck/features/inetgrate_inventory/views/integrate_inventory_page.dart';
import 'package:aislecheck/features/membership_plan/views/membership_plan_page.dart';
import 'package:aislecheck/features/payment_method/views/payment_method_page.dart';
import 'package:aislecheck/features/personal_chat/views/personal_chat_page.dart';
import 'package:aislecheck/features/profile_details/views/profile_details_page.dart';
import 'package:aislecheck/features/register_shop/views/register_shop_page.dart';
import 'package:aislecheck/features/schedule_item/views/schedule_item_page.dart';
import 'package:aislecheck/features/settings/views/settings_page.dart';
import 'package:aislecheck/features/shopping_items_operations/views/item_operation_page.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/shop_detail/views/shop_details_page.dart';
import 'package:aislecheck/features/shops_geo_location/views/shops_location.dart';
import 'package:aislecheck/features/shops_map/views/shops_map_page.dart';
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
    ShopsGeoLocation.name => AnimatedRoutes(
        setting: settings,
        child: const ShopsGeoLocation(),
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
        child: const ScheduleItemPage(),
      ),
    AdminHomePage.pageName => AnimatedRoutes(
        setting: settings,
        child: AdminHomePage(),
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
        child: MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context) => AdminSignupController(),
          ),
          ChangeNotifierProvider(
            create: (context) => PasswordFieldVisibility(),
          ),
        ], child: const AdminSignUpPage()),
      ),
    AdmminSignInPage.name => AnimatedRoutes(
        setting: settings,
        child: const AdmminSignInPage(),
      ),
    CreateNewAdsPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const CreateNewAdsPage(),
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
    PaymentMethodPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const PaymentMethodPage(),
      ),
    CancellationSurveyPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const CancellationSurveyPage(),
      ),
    IntegrateInventoryPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const IntegrateInventoryPage(),
      ),
    CustomerSupportPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const CustomerSupportPage(),
      ),
    SettingsPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const SettingsPage(),
      ),
    BoostPage.name => AnimatedRoutes(
        setting: settings,
        child: const BoostPage(),
      ),
    BoostStorePage.name => AnimatedRoutes(
        setting: settings,
        child: const BoostStorePage(),
      ),
    BoostProductPage.name => AnimatedRoutes(
        setting: settings,
        child: const BoostProductPage(),
      ),
    PersonalChatPage.pageName => AnimatedRoutes(
        setting: settings,
        child: const PersonalChatPage(),
      ),
    ShopsMapPage.name => AnimatedRoutes(
        setting: settings,
        child: const ShopsMapPage(),
      ),
    RegisterShopPage.name => AnimatedRoutes(
        setting: settings,
        child: const RegisterShopPage(),
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
