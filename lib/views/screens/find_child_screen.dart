import 'package:autism/models/parental_status.dart';
import 'package:autism/models/time_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:velocity_x/velocity_x.dart';

class FindChildScreen extends StatefulWidget {
  static final String _routeName = '/find-child-screen';

  static String get route {
    return _routeName;
  }

  const FindChildScreen({Key? key}) : super(key: key);

  @override
  _FindChildScreenState createState() => _FindChildScreenState();
}

class _FindChildScreenState extends State<FindChildScreen> {
  final _formKey = GlobalKey<FormState>();

  int? _warningDistance;
  bool? _isAutoParentLocation;
  bool? _isAutoChildLocation;
  int? _parentLocationUpdateDuration;
  TimeUnit? _parentTimeUnit;
  TimeUnit? _childTimeUnit;
  int? parentAutoUpdatingIndex;
  int? parentTimeUnitIndex;
  int? childAutoUpdatingIndex;
  int? childTimeUnitIndex;

  @override
  void initState() {
    super.initState();
    _isAutoParentLocation = true;
    _isAutoChildLocation = true;
    _parentTimeUnit = TimeUnit.seconds;
    _childTimeUnit = TimeUnit.seconds;
    _parentLocationUpdateDuration = 5;
    parentAutoUpdatingIndex = 0;
    parentTimeUnitIndex = 0;
    childAutoUpdatingIndex = 0;
    childTimeUnitIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "تنظیمات",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _warningDistanceTextField(),
                  SizedBox(
                    height: 25,
                  ),
                  _isAutoLocatingSwitch(
                    parentalStatus: ParentalStatus.parent,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Visibility(
                    visible: _isAutoParentLocation!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _updatingDurationSwitch(
                            parentalStatus: ParentalStatus.parent),
                        SizedBox(
                          height: 25,
                        ),
                        _locationDurationTextField(
                            parentalStatus: ParentalStatus.parent),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !_isAutoParentLocation!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _sendLocationButton(),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  _isAutoLocatingSwitch(parentalStatus: ParentalStatus.child),
                  SizedBox(
                    height: 25,
                  ),
                  Visibility(
                    visible: _isAutoChildLocation!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _updatingDurationSwitch(
                            parentalStatus: ParentalStatus.child),
                        SizedBox(
                          height: 25,
                        ),
                        _locationDurationTextField(
                            parentalStatus: ParentalStatus.child),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !_isAutoChildLocation!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _sendLocationButton(),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.black45,
                  ),
                  SizedBox(height: 10),
                  _saveButton(),
                  //_sendLocationButton(),
                ],
              ),
            ),
          ),
        ));
  }

  _saveInfoAlertBox() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: ' !اطلاعات ذخیره شد',
      animType: CoolAlertAnimType.scale,
      confirmBtnText: 'OK',
    );
  }

  _updateLocationAlertBox() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: ' !بروزرسانی انجام شد',
      animType: CoolAlertAnimType.scale,
      confirmBtnText: 'OK',
    );
  }

  Widget _isAutoLocatingSwitch({ParentalStatus? parentalStatus}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              parentalStatus == ParentalStatus.parent
                  ? 'بروزرسانی مبدا: '
                  : 'بروزرسانی مقصد:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          ToggleSwitch(
            initialLabelIndex: parentalStatus == ParentalStatus.parent
                ? parentAutoUpdatingIndex!
                : childAutoUpdatingIndex!,
            minWidth: 90.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            labels: ['خودکار', 'دستی'],
            activeBgColors: [Colors.lightBlue, Colors.deepPurple],
            changeOnTap: false,
            onToggle: (index) {
              print('Switched to: $index');
              if (parentalStatus == ParentalStatus.parent) {
                if (parentAutoUpdatingIndex != index)
                  _isAutoParentLocation = !_isAutoParentLocation!;
              } else {
                if (childAutoUpdatingIndex != index)
                  _isAutoChildLocation = !_isAutoChildLocation!;
              }
              print(parentalStatus == ParentalStatus.parent
                  ? _isAutoParentLocation
                  : _isAutoChildLocation);
              setState(() {
                if (parentalStatus == ParentalStatus.parent) {
                  parentAutoUpdatingIndex = index;
                } else {
                  childAutoUpdatingIndex = index;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _warningDistanceTextField() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'لطفا فاصله مدنظرتان را وارد کنید';
          }
          var length = int.parse(value);
          if (length > 200 || length < 10) {
            return "فاصله وارد شده باید بین ۱۰ تا ۲۰۰ متر باشد";
          }
          return null;
        },
        onSaved: (value) {
          _warningDistance = int.parse(value!);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          labelText: 'حداکثر شعاع فاصله بر حسب متر',
          alignLabelWithHint: true,
          prefixIcon: Icon(Icons.social_distance),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        textInputAction: TextInputAction.next,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  Widget _sendLocationButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _updateLocationAlertBox();
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.pinkAccent[700]!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'بروزرسانی',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _locationDurationTextField({ParentalStatus? parentalStatus}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: 150,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'لطفا زمان مدنظرتان را وارد کنید';
            }
            var duration = int.parse(value);
            if (parentalStatus == ParentalStatus.parent) {
              if (_parentTimeUnit == TimeUnit.seconds) {
                if (duration > 60 || duration < 30) {
                  return 'ثانیه باید بین ۳۰ تا ۶۰ باشد';
                }
              } else if (_parentTimeUnit == TimeUnit.minutes) {
                if (duration > 60 || duration < 1) {
                  return 'دقیقه باید بین ۱ تا ۶۰ باشد';
                }
              } else if (_parentTimeUnit == TimeUnit.hours) {
                if (duration > 24 || duration < 1)
                  return 'ساعت باید بین ۱ تا ۲۴ باشد';
              }
            } else if (parentalStatus == ParentalStatus.child) {
              if (_childTimeUnit == TimeUnit.seconds) {
                if (duration > 60 || duration < 30) {
                  return 'ثانیه باید بین ۳۰ تا ۶۰ باشد';
                }
              } else if (_childTimeUnit == TimeUnit.minutes) {
                if (duration > 60 || duration < 1) {
                  return 'دقیقه باید بین ۱ تا ۶۰ باشد';
                }
              } else if (_childTimeUnit == TimeUnit.hours) {
                if (duration > 24 || duration < 1)
                  return 'ساعت باید بین ۱ تا ۲۴ باشد';
              }
            }

            return null;
          },
          onSaved: (value) {
            _parentLocationUpdateDuration = int.parse(value!);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            labelText: 'زمان بروزرسانی',
            alignLabelWithHint: true,
            prefixIcon: Icon(Icons.timer),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          textInputAction: TextInputAction.next,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _saveInfoAlertBox();
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'ذخیره',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
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
          child: CupertinoAlertDialog(
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
                  Text(''),
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
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _updatingDurationSwitch({ParentalStatus? parentalStatus}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Row(
          children: [
            ToggleSwitch(
              minWidth: 60.0,
              minHeight: 35,
              cornerRadius: 20.0,
              fontSize: 13,
              activeBgColor: Colors.cyan,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              labels: ['ثانیه', 'دقیقه', 'ساعت'],
              activeBgColors: [
                Vx.green500,
                Vx.amber400,
                Vx.red700
              ],
              onToggle: (index) {
                // print('Switched to: $index'
                print(parentalStatus);
                if (parentalStatus == ParentalStatus.parent) {
                  if (index == 0) {
                    _parentTimeUnit = TimeUnit.seconds;
                  } else if (index == 1) {
                    _parentTimeUnit = TimeUnit.minutes;
                  } else if (index == 2) {
                    _parentTimeUnit = TimeUnit.hours;
                  }
                } else if (parentalStatus == ParentalStatus.child) {
                  if (index == 0) {
                    _childTimeUnit = TimeUnit.seconds;
                  } else if (index == 1) {
                    _childTimeUnit = TimeUnit.minutes;
                  } else if (index == 2) {
                    _childTimeUnit = TimeUnit.hours;
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
