import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickfix/widget/button1.dart';

class Detailsscreen extends StatelessWidget {
  const Detailsscreen({this.DassetPath, this.Dname, this.Dprice});
  final DassetPath, Dname, Dprice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Change the color as needed
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Details Item",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // SizedBox(
          //   height: 15.0,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: 20.0),
          //   child: Text(
          //     "Citem",
          //     style: TextStyle(
          //         fontSize: 25.0,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black),
          //   ),
          // ),
          SizedBox(
            height: 25.0,
          ),

          Hero(
              tag: DassetPath,
              child: Image.asset(
                DassetPath,
                height: 300.0,
                width: 300.0,
                fit: BoxFit.contain,
              )),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Divider(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  Dprice,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                Dname,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'here we go agin here we go agin here we go agin here we go agine here we go agine',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: Button1(
                title: "Add To Card",
                onPress: () {
                  // loginController.onSubmit();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Homescreen()),
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
