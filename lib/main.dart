import 'package:autism/views/screens/contact_us_screen.dart';
import 'package:autism/views/screens/device_code_validation_screen.dart';
import 'package:autism/views/screens/find_child_screen.dart';
import 'package:autism/views/screens/home_screen.dart';
import 'package:autism/views/screens/login_screen.dart';
import 'package:autism/views/screens/medical_facilities_screen.dart';
import 'package:autism/views/screens/news_screen.dart';
import 'package:autism/views/screens/profile_screen.dart';
import 'package:autism/views/screens/sign_up_screen.dart';
import 'package:autism/views/screens/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LocPhin",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.green,
        canvasColor: Vx.blueGray300,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'IranSans',
      ),
      // home: SignUpScreen(),
      routes: {
        '/': (ctx) => HomeScreen(),
        MedicalFacilitiesScreen.route: (ctx) => MedicalFacilitiesScreen(),
        VideosScreen.route: (ctx) => VideosScreen(),
        NewsScreen.route: (ctx) => NewsScreen(),
        FindChildScreen.route: (ctx) => FindChildScreen(),
        HomeScreen.route: (ctx) => HomeScreen(),
        ContactUsScreen.route: (ctx) => ContactUsScreen(),
        ProfileScreen.route: (ctx) => ProfileScreen(),
        SignUpScreen.route: (ctx) => SignUpScreen(),
        LoginScreen.route: (ctx) => LoginScreen(),
        DeviceCodeValidationScreen.route: (ctx) => DeviceCodeValidationScreen(),
      },
    );
  }
}
