import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_trial_app/components/inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_trial_app/Screens/PlantList/plant_model.dart';
import 'package:firebase_trial_app/Screens/PlantList/plant_screen.dart';

// kapag tapped yung items sa cart list, ma initiated tong code na to
// these include plant descriptions etc

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  PageController? pageController;
  int selectedPage = 0;
  List<PlantObj> plantList = [];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    fetchTransaction();
  }

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  void fetchTransaction() {
    _database.child('Plant_Inventory').get().then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        final List<dynamic> data = snapshot.value as List;
        //final data = List<Object>.from(snapshot.value as List);
        for (var x in data) {
          if (x != null) {
            final Map<String, dynamic> data2 = Map<String, dynamic>.from(x);
            plantList.add(PlantObj(
                careNeeds: data2['Care_Needs'],
                commonName: data2['Common_Name'],
                description: data2['Description'],
                lightExposure: data2['Light_Exposure'],
                imageUrl: data2['Photo'],
                plantID: data2['Plant_ID'],
                price: data2['Price'],
                scientificName: data2['Scientific_Name'],
                stock: data2['Stock'],
                waterUse: data2['Water_Use']));
          } else {}
        }
      }
    });
  }

  plantSelector(int index) {
    return AnimatedBuilder(
      animation: pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController!.position.haveDimensions) {
          value = pageController!.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.1, 1.0);
        }
        // ignore: avoid_unnecessary_containers
        return Container(
          child: SizedBox(
            height: 180,
            width: 380,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantScreen(plant: plants[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF32A060),
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: plants[index].imageUrl!,
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          'assets/images/plant$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'FROM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          //not be immutable
                          '\${plants[index].price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plants[index].category!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          plants[index].name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[], // Nani?
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Plant Cart List',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 550,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                itemCount: plants.length,
                itemBuilder: (BuildContext context, int index) {
                  return plantSelector(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
