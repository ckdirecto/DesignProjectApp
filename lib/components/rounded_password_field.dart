import 'package:flutter/material.dart';
import 'package:plant_shop/components/text_field_container.dart';
import 'package:plant_shop/constants.dart';

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
        cursorColor: PrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: PrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: PrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
