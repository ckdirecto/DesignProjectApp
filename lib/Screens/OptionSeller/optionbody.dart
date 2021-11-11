import 'package:flutter/material.dart';
import 'package:plant_shop/Screens/Welcome/components/background.dart';
import 'package:plant_shop/constants.dart';
import 'package:plant_shop/components/optionseller.dart';
import 'package:plant_shop/Screens/LoginSeller/loginseller.dart';
import 'package:plant_shop/Screens/LoginCustomer/logincustomer.dart';

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
                      return LoginSeller();
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
