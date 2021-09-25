import 'package:flutter/material.dart';
import 'package:plant_shop/Screens/Signup/components/background.dart';
import 'package:plant_shop/components/rounded_button.dart';
import 'package:plant_shop/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/shop-logo.png",
                width: size.width * 0.3,
              ),
            ),
            Text(
              "plant shop",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 28.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.07),
            Text(
              "Welcome, customer!",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 26.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            RoundedInputField(
              hintText: "Enter generated pin",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Proceed",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
