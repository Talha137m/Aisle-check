import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/theme/app_theme.dart';
import 'package:aislecheck/features/on_boarding/views/on_bording_page.dart';
import 'package:aislecheck/features/user_home/views/widgets/browse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Making the app should stay in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aisle Check',
      theme: AppTheme.theme(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      initialRoute: OnBordingPage.name,
      onGenerateRoute: generateRoute,
      home: const Browse(),
    );
  }
}
