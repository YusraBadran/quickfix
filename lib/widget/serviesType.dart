import 'package:flutter/material.dart';

import 'package:quickfix/widget/categories.dart';

class ServiesType extends StatelessWidget {
  final String? label;
  final String? label2;
  final String? image;
  final VoidCallback onPress;
  const ServiesType({
    super.key,
    this.label,
    this.label2,
    this.image,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 130,
        // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
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
            Container(
              child: image == null
                  ? Image.asset(
                      "assets/images/testS.png",
                      height: 90,
                      width: 90,
                    )
                  : Image.network(image!),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                label ?? '',
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
    );
  }
}
