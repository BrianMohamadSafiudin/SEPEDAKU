import 'package:sepedaku/screens/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sepedaku/components/background.dart';
import 'package:sepedaku/components/lang/language.provider.dart';
import 'package:sepedaku/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEPEDAKU',
      theme: ThemeData(),
      home: Column(
        children: [
          Background(
            child: AnimatedSplashScreen(
              splash: "assets/images/logo.png",
              splashIconSize: size.height * 0.5,
              nextScreen: WelcomeScreen(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.rightToLeft,
            ),
          ),
          WidgetTree(),
        ],
      ),
    );
  }
}
