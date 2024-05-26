import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back,
        //       color: Colors.white), // Change the color as needed
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        automaticallyImplyLeading: false,
        title: Text(
          "HOME",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff80C7F7),
      ),
      backgroundColor: Color.fromARGB(255, 222, 238, 250),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
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
          ],
        ),
      ),
    );
  }
}
