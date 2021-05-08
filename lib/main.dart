import 'package:autism/views/home_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Autism",
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0)),
      home: HomeScreen(),
    );
  }
}
