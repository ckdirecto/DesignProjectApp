import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/Welcome/components/background.dart';
import 'package:firebase_trial_app/constants.dart';
import 'package:firebase_trial_app/components/optionseller.dart';
import 'package:firebase_trial_app/Screens/Inventory/inventory.dart';
import 'package:firebase_trial_app/Screens/Transactions/transactions.dart';

class OptionSellerBody extends StatelessWidget {
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
                color: Colors.black,
                fontSize: 28.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            OptionSellerButton(
              text: "Inventory",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Inventory();
                    },
                  ),
                );
              },
            ),
            OptionSellerButton(
              text: "Transactions",
              color: PrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Transaction();
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
