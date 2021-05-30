import 'package:autism/data/medical_facilities_repo.dart';
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
            "Medical Facilities",
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 25,
                fontFamily: "Errorist"),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Column(
          children: [
            MedicalFacilityRow(facilities[0]),
            MedicalFacilityRow(facilities[1])
          ],
        ));
  }
}

class MedicalFacilityRow extends StatelessWidget {
  final MedicalFacility medicalFacility;

  MedicalFacilityRow(this.medicalFacility);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      alignment: FractionalOffset.centerRight,
      child: Image(
        image: AssetImage(medicalFacility.imageURL!),
        height: 92.0,
        width: 92.0,
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Errorist');
    final secondTextStyle = const TextStyle(fontFamily: 'IranSans');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = secondTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 36.0, 26.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 14.0),
          Text(medicalFacility.name!, style: headerTextStyle),
          Container(height: 10.0),
          Text(medicalFacility.website!, style: subHeaderTextStyle),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: (medicalFacility.name!.length * 4).toDouble(),
              color: Color(0xff00c6ff)),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 124.0,
      margin: EdgeInsets.only(right: 43),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
