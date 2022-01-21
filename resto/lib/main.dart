import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:resto/screen/homepage/homepage.dart';
import 'package:resto/screen/landingpage/landing1.dart';
import 'package:resto/screen/landingpage/landing2.dart';
import 'package:resto/screen/landingpage/landing3.dart';
import 'package:resto/screen/loginregister/login.dart';
import 'package:resto/screen/loginregister/register.dart';
import 'package:resto/services/auth.dart';

import 'package:resto/style/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: secondaryColor,
          )
        ),
        

      ),
      initialRoute: LandingPage1.routeName,
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        LandingPage1.routeName : (context) => const LandingPage1(),
        LandingPage2.routeName : (context) => const LandingPage2(),
        LandingPage3.routeName : (context) => const LandingPage3(),
        LoginPage.routeName : (context) => const LoginPage(),
        RegisterPage.routeName : (context) => const RegisterPage(),
        

      },
    );
  }
}




