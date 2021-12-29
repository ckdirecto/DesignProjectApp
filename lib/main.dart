import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_trial_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return const Text('Something went wrong');
          } else if (snapshot.hasData) {
            print('Firebase Connected');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Plant Shop',
              theme: ThemeData(
                primaryColor: primaryColor,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: const WelcomeScreen(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
