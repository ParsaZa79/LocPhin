import 'package:autism/models/validation.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  ValidationModel _name = ValidationModel(null, null);

  ValidationModel get email => _email;

  ValidationModel get password => _password;

  ValidationModel get phone => _phone;

  ValidationModel get name => _name;
}
