import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_trial_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plant Shop',
            theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const WelcomeScreen(),
          );
        });
  }
}
