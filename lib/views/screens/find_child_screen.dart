import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FindChildScreen extends StatelessWidget {
  static final String _routeName = '/find-child-screen';

  static String get route {
    return _routeName;
  }

  const FindChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      labelText: 'حداکثر شعاع فاصله بر حسب متر',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.label_important),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.deepOrangeAccent),
                      child: IconButton(
                        icon: Icon(Icons.save_outlined),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Colors.amber),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'نمایش موقعیت جغرافیایی',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
