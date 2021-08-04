import 'package:autism/data/repo/medical_facilities_repo.dart';
import 'package:autism/models/medical_facility.dart';
import 'package:flutter/material.dart';

class MedicalFacilitiesScreen extends StatelessWidget {
  static final String _routeName = '/facilities-screen';

  static String get route {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مراکز درمانی",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "IranSans",
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text("Hi"),
      ),
    );
  }
}
