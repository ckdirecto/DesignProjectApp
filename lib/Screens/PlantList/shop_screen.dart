import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop/Screens/PlantList/plant_model.dart';
import 'package:plant_shop/Screens/PlantList/plant_screen.dart';

class ShopScreen extends StatefulWidget {
  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  PageController? pageController;
  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
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
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 180.0,
            width: Curves.easeInOut.transform(value) * 380.0,
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
                color: Color(0xFF32A060),
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
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
                      children: <Widget>[
                        Text(
                          'FROM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '\P${plants[index].price}',
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          plants[index].name!,
                          style: TextStyle(
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
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Plant Cart List',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 200.0,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
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
