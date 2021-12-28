import 'package:flutter/material.dart';
import 'package:firebase_trial_app/Screens/OptionSeller/optionbody.dart';

class OptionSeller extends StatelessWidget {
  const OptionSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OptionSellerBody(),
    );
  }
}
