import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static final String _routeName = '/profile-screen';

  static String get route {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 25,
                fontFamily: "Errorist"),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Center(
          child: Text('Hi'),
        ));
  }
}
