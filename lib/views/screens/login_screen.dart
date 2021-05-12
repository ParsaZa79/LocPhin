import 'package:autism/views/components/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  static final String _routeName = '/facilities-screen';

  static String get route {
    return _routeName;
  }

  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(),
        appBar: AppBar(
            title: Text(
          "Find Your Child",
          style: TextStyle(
              color: Colors.amberAccent, fontSize: 25, fontFamily: "Errorist"),
        )),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            child: ListView(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'حداکثر شعاع فاصله',
                        hintText: '[200 - 10] ' + 'متر',
                        alignLabelWithHint: true),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () => {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'نمایش موقعیت جغرافیایی',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
