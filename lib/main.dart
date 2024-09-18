import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/config/theme/app_theme.dart';
import 'package:aislecheck/features/ad_payment/controllers/payment_option.dart';
import 'package:aislecheck/features/admin_home/controllers/admin_bottom_controller.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_admin_login.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_shop_register.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_user_login.dart';
import 'package:aislecheck/features/choose_role/controllers/choose_role_controller.dart';
import 'package:aislecheck/features/forecasting/controllers/stats_controller.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/register_shop/controllers/current_location_controller.dart';
import 'package:aislecheck/features/register_shop/controllers/register_shop_controller.dart';
import 'package:aislecheck/features/register_shop/controllers/shop_image_picker_controller.dart';
import 'package:aislecheck/features/schedule_item/controller/date_controller.dart';
import 'package:aislecheck/features/schedule_item/controller/time_picker_controller.dart';
import 'package:aislecheck/features/shops_geo_location/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/shops_map/controllers/map_controller.dart';
import 'package:aislecheck/features/user_home/controllers/user_bottom_controller.dart';
import 'package:aislecheck/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //....dependencies injections
  setupLocator();
  // ...........Making the app should stay in portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        //...this is the provider for to choose time from time picker
        ChangeNotifierProvider(
          create: (context) => TimePickerController(),
        ),
        //....this is the provider for to choose date from date picker
        ChangeNotifierProvider(
          create: (context) => DateController(),
        ),
        //....this is the provider for bottom naivation
        ChangeNotifierProvider(
          create: (context) => UserBottomController(),
        ),
        //....this is the provider for shops location
        //....to track the locatiions
        ChangeNotifierProvider(
          create: (context) => ShopsLocationController(),
        ),
        //....this is the provider for to choose which payment option
        ChangeNotifierProvider(
          create: (context) => PaymentOptionController(),
        ),
        //....this is the provider for inventry stats
        ChangeNotifierProvider(
          create: (context) => StatsController(),
        ),
        //....provider for map
        ChangeNotifierProvider(
          create: (context) => MapController(),
        ),
        //....admin side bottom navigation provider
        ChangeNotifierProvider(
          create: (context) => AdminBottomController(),
        ),
        //....provider for choose role
        ChangeNotifierProvider(
          create: (context) => ChooseRoleController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckIsShopRegisterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckIsAdminLoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckIsUserLoginController(),
        ),
        ///provider for to register shop
         ChangeNotifierProvider(
            create: (context) => ShopImagePickerController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CurrentLocationController(),
          ),
          ChangeNotifierProvider(
            create: (context) => RegisterShopController(),
          ),
      ],
      child: const AisleCheckApp(),
    ),
  );
}

class AisleCheckApp extends StatelessWidget {
  const AisleCheckApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aisle Check',
      theme: AppTheme.theme(),
      navigatorKey: NavigationState.navigatorKey,
      initialRoute: OnBordingPage.name,
      onGenerateRoute: generateRoute,

      //home: const ErrorMessageWidget(),

      // home: MultiProvider(providers: [
      //   ChangeNotifierProvider(
      //     create: (context) {
      //       return ShopImagePickerController();
      //     },
      //   ),
      //   ChangeNotifierProvider(
      //     create: (context) => RegisterShopController(),
      //   ),
      //   ChangeNotifierProvider(
      //     create: (context) => CurrentLocationController(),
      //   )
      // ], child: const RegisterShopPage()),
    );
  }
}
