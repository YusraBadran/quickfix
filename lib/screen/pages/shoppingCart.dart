import 'package:flutter/material.dart';
import 'package:quickfix/widget/CartBottomNavBar.dart';
import 'package:quickfix/widget/cartItem.dart';

class Shoppingcart extends StatefulWidget {
  const Shoppingcart({super.key});

  @override
  State<Shoppingcart> createState() => _ShoppingcartState();
}

class _ShoppingcartState extends State<Shoppingcart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CART",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
      ),
      backgroundColor: Color.fromARGB(140, 243, 250, 255),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                cartItem(),
                // Container(
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(50)),
                // )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
