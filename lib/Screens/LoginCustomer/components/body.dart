import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/PlantList/shop_screen.dart';
import 'package:firebase_trial_app/Screens/LoginCustomer/components/background.dart';
import 'package:firebase_trial_app/components/rounded_button.dart';
import 'package:firebase_trial_app/components/rounded_input_field.dart';
import 'package:firebase_trial_app/components/transaction.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    fetchTransaction();
  }

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  void fetchTransaction() {
    _database.child('Transaction').get().then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final Map<String, dynamic> data2 = Map<String, dynamic>.from(data);

        //Variable where transactionIDList is stored.
        final List<String> dataList =
            TransactionList.fromRTDB(data2).getTransactionIdList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String pin = '';
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
            SizedBox(height: size.height * 0.07),
            const Text(
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
              onChanged: (value) {
                pin = value;
              },
            ),
            RoundedButton(
              text: "Proceed",
              press: () {
                Navigator.push(
                  context,
                  verifyPin(int.parse(pin)),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  //Eto Clodiiii
  MaterialPageRoute verifyPin(int pin) {
    //Eto clodii lagyan mo ng if statement.
    return MaterialPageRoute(builder: (context) {
      return const ShopScreen();
    });
  }
}
