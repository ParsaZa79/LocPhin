import 'package:flutter/material.dart';

class ChildForm extends StatefulWidget {
  @override
  _ChildFormState createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Sign up",
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
                      labelText: 'نام کاربری',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'نام',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'نام خانوادگی',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.person_add_alt),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'رمز عبور',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () => {
                    
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'ثبت نام',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

