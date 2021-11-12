import 'package:flutter/material.dart';
import 'package:plant_shop/Screens/LoginSeller/loginseller.dart';
import 'package:plant_shop/Screens/LoginCustomer/logincustomer.dart';
import 'package:plant_shop/Screens/Welcome/components/background.dart';
import 'package:plant_shop/components/rounded_button.dart';
import 'package:plant_shop/constants.dart';

class Transaction extends StatelessWidget {
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
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "Seller",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginSeller();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Customer",
              color: PrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginCustomer();
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