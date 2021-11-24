import 'package:flutter/material.dart';
import 'package:firebase_trial_app/constants.dart';

class OptionSellerButton extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  const OptionSellerButton({
    Key? key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text!,
        style: TextStyle(color: textColor),
      ),
      onPressed: press as void Function()?,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 45),
          textStyle: TextStyle(
              color: textColor,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400)),
    );
  }
}
