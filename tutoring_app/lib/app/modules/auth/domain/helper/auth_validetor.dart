import 'package:flutter/material.dart';

class AuthValidators {
  String? userNameValidator(String? value) {
    if (value != null && value.length > 3) {
      return null;
    } else {
      return "Your username should be atleast 4 charecters long";
    }
  }

  // Password validator
  String? passwordVlidator(String? val) {
    final String password = val as String;

    if (password.isEmpty || password.length <= 5) {
      return "Your password must be atleast 6 charecters long";
    }
    return null;
  }

  // A simple email validator that  checks the presence and position of @
  String? emailValidator(String? value) {
    debugPrint("emailValidator $value");
    if (value != null) {
      final bool emailValid = RegExp(
              r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$')
          .hasMatch(value);
      if (emailValid) {
        return null;
      }
    }
    return "Emial is Not Valid";
  }
}
