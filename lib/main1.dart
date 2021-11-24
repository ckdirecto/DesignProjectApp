import 'package:firebase_trial_app/realtime_db/display_inventory.dart';
import 'package:firebase_trial_app/realtime_db/display_transactions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
}

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Inventory",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RealtimeDatabaseDisplay()),
                    );
                  },
                  child: const Text(
                    "View Inventory",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RealtimeTransactionsDisplay()),
                    );
                  },
                  child: const Text(
                    "View Transactions",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
