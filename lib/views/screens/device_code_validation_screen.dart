import 'package:autism/utils/socket_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../extensions/string_extensions.dart';

class DeviceCodeValidationScreen extends StatefulWidget {
  static final String _routeName = '/device-code-validation';

  static String get route {
    return _routeName;
  }

  DeviceCodeValidationScreen({Key? key}) : super(key: key);

  @override
  _DeviceCodeValidationScreenState createState() =>
      _DeviceCodeValidationScreenState();
}

class _DeviceCodeValidationScreenState
    extends State<DeviceCodeValidationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _deviceCode;

  Widget _deviceCodeField() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (!value!.isValidPhone) {
            return 'لطفا کد را درست وارد کنید';
          }
          return null;
        },
        onSaved: (value) {
          _deviceCode = value;
        },
        decoration: InputDecoration(
          labelText: 'کد دستگاه',
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.device_unknown_rounded),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Future<void> _showResultDialog(
      {@required String? title,
      @required String? message,
      @required bool? isSuccessful}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              title!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSuccessful! ? Colors.teal : Colors.red[900]),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(message!),
                ],
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: const Text(
                    'متوجه شدم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (isSuccessful) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "اتصال به دستگاه",
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
        body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _deviceCodeField(),
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      SocketUtil.listenToSocket(_deviceCode);
                      print('Before if statement!');
                      // sleep(Duration(seconds: 2));
                      if (SocketUtil.isDeviceCodeCorrect!) {
                        _showResultDialog(
                            title: 'موفقیت',
                            message:
                                'کد وارد شده صحیح می‌باشد, در صورت تمایل میتوانید کد جدیدی وارد کنید',
                            isSuccessful: true);
                      } else {
                        _showResultDialog(
                            title: 'کد نادرست',
                            message:
                                'کد وارد شده صحیح نمیباشد, لطفا مجددا کد را وارد کنید',
                            isSuccessful: false);
                      }
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'بررسی',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
