import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'login_view.dart';

class LoginViewModel extends FormViewModel {
  final RegExp alphabetRegExp = RegExp(r'[A-Za-z]');
  final RegExp numberRegExp = RegExp(r'\d');
  final RegExp symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final homeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? passwordValidation(String password) {
    if (password.isEmpty) {
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

  String? emailValidation(String? email) {
    if (email != null) {
      if (!email.contains('@') || !email.contains('.') || email.isEmpty) {
        return "Email format is not valid";
      } else if (!emailRegExp.hasMatch(email)) {
        return "Enter a valid email";
      }
    }
    return null;
  }
}
