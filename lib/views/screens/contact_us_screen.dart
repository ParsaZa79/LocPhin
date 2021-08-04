import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ContactUsScreen extends StatelessWidget {
  static final String _routeName = '/contact-us-screen';

  static String get route {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ارتباط با ما",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  "آدرس".text.xl.make(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
