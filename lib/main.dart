import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/theme/app_theme.dart';
import 'package:aislecheck/features/ad_payment/controllers/payment_option.dart';
import 'package:aislecheck/features/choose_role/controllers/choose_role_controller.dart';
import 'package:aislecheck/features/forecasting/controllers/stats_controller.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/schedule_item/controller/date_controller.dart';
import 'package:aislecheck/features/schedule_item/controller/time_picker_controller.dart';
import 'package:aislecheck/features/shops_geo_location/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/shops_map/controllers/map_controller.dart';
import 'package:aislecheck/features/user_home/controllers/user_bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  // ...........Making the app should stay in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TimePickerController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserBottomController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShopsLocationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentOptionController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChooseRoleController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aisle Check',
      theme: AppTheme.theme(),
      navigatorKey: NavigationState.navigatorKey,

      initialRoute: OnBordingPage.name,
      onGenerateRoute: generateRoute,

      //home: const ShopsGeoLocation(),
    );
  }
}
