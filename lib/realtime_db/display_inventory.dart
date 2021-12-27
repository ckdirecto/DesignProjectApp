import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  RealtimeDatabaseDisplayState createState() => RealtimeDatabaseDisplayState();
}

// plant inventory only shows plants, walang kasamang no. of inventory
// must include edit, delete, add inventory

class RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child("Plant_Inventory");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          var x = snapshot.value['Common_Name'];
          // ignore: avoid_print
          print(x);
          return ListTile(
            subtitle: Text(snapshot.value['Scientific_Name']),
            title: Text(snapshot.value['Common_Name']),
          );
        },
      )),
    );
  }
}
