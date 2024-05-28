import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quickfix/screen/MCenters.dart';
import 'package:quickfix/screen/SCenters.dart';
import 'package:quickfix/screen/detailsScreen.dart';
import 'package:quickfix/widget/categories.dart';
import 'package:quickfix/widget/serviceMap.dart';
import 'package:quickfix/widget/serviesType.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myItems = [
    ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset("assets/images/autoImage1.JPG"),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset("assets/images/autoImage3.JPG"),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset("assets/images/autoImage2.JPG"),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset("assets/images/autoImage4.JPG"),
    ),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "HOME",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
        elevation: 3.0,
      ),
      backgroundColor: Color.fromARGB(140, 243, 250, 255),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 190,
                        // autoPlayCurve: Curve.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            myCurrentIndex = index;
                          });
                        }),
                    items: myItems),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "Our Services",
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 112, 180),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      // const Divider(),
                    ),
                  ],
                ),
                Categories(
                  Cname: "yusra badran",
                  Cprice: "\$ 200",
                  CassetPath: "assets/images/testS.png",
                ),
                // ServiesType(),
                Servicemap(
                  label: "Maintenance",
                  label2: "Centers",
                  image: "assets/images/mapLogo.png",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mcenters()));
                  },
                ),
                Servicemap(
                  label: "Spare Parts",
                  label2: "Centers",
                  image: "assets/images/mapLogo.png",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scenters()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
