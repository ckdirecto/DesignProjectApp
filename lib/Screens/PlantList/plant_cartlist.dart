import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/PlantList/shop_screen.dart';

class PlantCartlist extends StatelessWidget {
  const PlantCartlist({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShopScreen(),
    );
  }
}
