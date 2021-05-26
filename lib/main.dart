import 'package:autism/views/screens/contact_us_screen.dart';
import 'package:autism/views/screens/find_child_screen.dart';
import 'package:autism/views/screens/home_screen.dart';
import 'package:autism/views/screens/login_screen.dart';
import 'package:autism/views/screens/medical_facilities_screen.dart';
import 'package:autism/views/screens/news_screen.dart';
import 'package:autism/views/screens/profile_screen.dart';
import 'package:autism/views/screens/sign_up_screen.dart';
import 'package:autism/views/screens/videos_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LocPhin",
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.blueAccent,
          canvasColor: Color.fromRGBO(231, 237, 231, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'IranSans'),
      home: HomeScreen(),
      routes: {
        MedicalFacilitiesScreen.route: (ctx) => MedicalFacilitiesScreen(),
        VideosScreen.route: (ctx) => VideosScreen(),
        NewsScreen.route: (ctx) => NewsScreen(),
        FindChildScreen.route: (ctx) => FindChildScreen(),
        HomeScreen.route: (ctx) => HomeScreen(),
        ContactUsScreen.route: (ctx) => ContactUsScreen(),
        ProfileScreen.route: (ctx) => ProfileScreen(),
        SignUpScreen.route: (ctx) => SignUpScreen(),
        LoginScreen.route: (ctx) => LoginScreen()
      },
    );
  }
}
