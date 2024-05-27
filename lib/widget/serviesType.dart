import 'package:flutter/material.dart';

class ServiesType extends StatelessWidget {
  const ServiesType({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.99,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xff80C7F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/testS.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Service Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
