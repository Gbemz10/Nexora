import 'package:flutter/material.dart';
import 'package:nexora/ui/common/text%20validation.dart';
import 'package:nexora/ui/views/login/login_viewmodel.dart';

class EmailFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const EmailFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        return Validation.emailValidation(value);
      },
    );
  }
}

class PasswordFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const PasswordFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      validator: (value) {
        return Validation.passwordValidation(value);
      },
    );
  }
}

//class PrimaryButtonContainer extends StatelessWidget {}
