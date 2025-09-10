import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'login_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:nexora/app/app.locator.dart';
import 'package:nexora/app/app.router.dart';

class LoginViewModel extends FormViewModel {
  final homeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _navigationService = locator<NavigationService>();
  void navigateToSignUpPage() {
    _navigationService.navigateToSignUpView();
  }

  void navigateToLoginPage() {
    _navigationService.navigateToLoginView();
  }

  void goBack() {
    _navigationService.back();
  }
}
