import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/theme/app_theme.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // ...........Making the app should stay in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      // home: const ScheduleItemPage(),
    );
  }
}
