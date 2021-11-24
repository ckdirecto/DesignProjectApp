import 'package:flutter/material.dart';
import 'package:firebase_trial_app/components/text_field_container.dart';
import 'package:firebase_trial_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
