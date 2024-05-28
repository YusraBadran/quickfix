import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Servicemap extends StatelessWidget {
  const Servicemap({
    Key? key,
    // required this.controller,
    required this.label,
    required this.label2,
    required this.image,
    required this.onPress,
  }) : super(key: key);
  final String label;
  final String label2;
  final String image;
  final VoidCallback onPress;
  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: GridView.count(
          childAspectRatio: 0.99,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            // for (int i = 0; i < 1; i++)
            GestureDetector(
              onTap: onPress,
              // Wrap the Container in a GestureDetector
              // onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Detailsscreen()));
              // },
              child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xff80C7F7),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 10, 112, 180).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 2),
                        child: Image.asset(
                          image,
                          // "assets/images/testS.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        label2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
