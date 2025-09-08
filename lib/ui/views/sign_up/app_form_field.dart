import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  const AppFormField({super.key, required this.hintText});

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
        return emailValidation(value);
      },
    );
  }
}
