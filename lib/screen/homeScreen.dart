import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quickfix/screen/pages/home.dart';
import 'package:quickfix/screen/pages/setting.dart';
import 'package:quickfix/screen/pages/shoppingCart.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final items = const [
    Icon(
      Icons.miscellaneous_services_sharp,
      size: 35,
      color: Color.fromARGB(255, 10, 112, 180),
    ),
    Icon(
      Icons.home_outlined,
      size: 35,
      color: Color.fromARGB(255, 10, 112, 180),
    ),
    Icon(
      Icons.shopping_cart,
      size: 35,
      color: Color.fromARGB(255, 10, 112, 180),
    ),
  ];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Color(0xff80C7F7),
          items: items,
          index: index,
          onTap: (selctedIndex) {
            setState(() {
              index = selctedIndex;
            });
          }),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Setting();
        break;
      case 1:
        widget = const Home();
        break;

      default:
        widget = const Shoppingcart();
        break;
    }
    return widget;
  }
}
