import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
//import 'package:nexora/login_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:nexora/app/app.locator.dart';
import 'package:nexora/app/app.router.dart';

class Validation {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static String? emailValidation(String? email) {
    if (email != null) {
      if (!email.contains('@') || !email.contains('.') || email.isEmpty) {
        return "Email format is not valid";
      } else if (!emailRegExp.hasMatch(email)) {
        return "Enter a valid email";
      }
    }
    return null;
  }

  static RegExp alphabetRegExp = RegExp(r'[A-Za-z]');
  static RegExp numberRegExp = RegExp(r'\d');
  static RegExp symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter your password.";
    } else if (password.length < 8) {
      return "Enter a valid password(min. 8 char)";
    }
    if (!alphabetRegExp.hasMatch(password)) {
      return 'Password must contain at least 1 letter';
    }
    if (!numberRegExp.hasMatch(password)) {
      return 'Password must contain at least 1 number';
    }
    if (!symbolRegExp.hasMatch(password)) {
      return 'Password must contain at least 1 special character';
    }
    return null;
  }
}
