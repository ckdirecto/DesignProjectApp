import 'package:firebase_trial_app/Screens/LoginCustomer/logincustomer.dart';
import 'package:firebase_trial_app/Screens/LoginSeller/components/body.dart';
import 'package:firebase_trial_app/components/rounded_button.dart';
import 'package:firebase_trial_app/components/transaction.dart';
import 'package:firebase_trial_app/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _FetchTransaction();
  }

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  void _FetchTransaction() {
    _database.child('Transaction').get().then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final Map<String, dynamic> data2 = new Map<String, dynamic>.from(data);
        final TransactionList dataList = TransactionList.fromRTDB(data2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/homescreen-bg.png',
              height: size.height,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              color: const Color.fromRGBO(0, 0, 0, 0),
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
                    'plant shop',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 28.0,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  RoundedButton(
                      text: 'Seller',
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      }),
                  RoundedButton(
                      text: 'Customer',
                      color: primaryColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginCustomer();
                        }));
                      })
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
