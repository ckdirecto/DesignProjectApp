import 'package:firebase_trial_app/constants.dart';
import 'package:firebase_trial_app/realtime_db/display_inventory.dart';
import 'package:firebase_trial_app/realtime_db/display_transactions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_trial_app/components/rounded_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

// main file ng connection sa db, if nililipat ko sa sariling
// folder for db connection di gumagana lmao

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/shop-logo.png",
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
                const Text(
                  "Seller Interface",
                  style: TextStyle(
                      color: primaryColor, fontFamily: 'Poppins', fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedButton(
                  text: "View Inventory",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RealtimeDatabaseDisplay()),
                    );
                  },
                ),
                RoundedButton(
                  text: "View Transactions",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RealtimeTransactionsDisplay()),
                    );
                  },
                ),
              ],
            )),
      ),
    ));
  }
}
