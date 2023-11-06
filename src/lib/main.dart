import 'package:camera/camera.dart';
import 'package:sepedaku/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/screens/welcome/welcome_screen.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';  // Import halaman DashboardScreen
import 'package:firebase_auth/firebase_auth.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  cameras = await availableCameras();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('id')],
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Periksa apakah pengguna masih dalam sesi login
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'SEPEDAKU',
      theme: ThemeData(),
      home: 
            Background(
              child: AnimatedSplashScreen(
                splash: "assets/images/logo.png",
                splashIconSize: size.height * 0.5,
                nextScreen: isLoggedIn ? DashboardScreen() : WelcomeScreen(),
                splashTransition: SplashTransition.fadeTransition,
              ),
            ),

    );
  }
}
