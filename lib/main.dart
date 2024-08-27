import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/theme/app_theme.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/shops_map/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/shops_map/views/shops_location.dart';
import 'package:aislecheck/features/user_home/controllers/user_bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async{
  // ...........Making the app should stay in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserBottomController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShopsLocationController(),
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

     // home: const ShopsLocation(),
    );
  }
}
