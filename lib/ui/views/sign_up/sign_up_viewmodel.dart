import 'package:stacked/stacked.dart';
import 'sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:nexora/app/app.dart';
import 'package:nexora/app/app.locator.dart';
import 'package:nexora/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static final _navigationService = locator<NavigationService>();
  static final homeKey = GlobalKey<FormState>();

  void navigateToSignUpPage() {
    _navigationService.navigateToSignUpView();
  }

  void navigateToLoginPage() {
    _navigationService.navigateToLoginView();
  }
}
