import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/LoginSeller/loginseller.dart';
import 'package:firebase_trial_app/Screens/LoginCustomer/logincustomer.dart';
import 'package:firebase_trial_app/components/background.dart';
import 'package:firebase_trial_app/components/rounded_button.dart';
import 'package:firebase_trial_app/constants.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

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
            const Text(
              "plant shop",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 28.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "Seller",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginSeller();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Customer",
              color: primaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginCustomer();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
