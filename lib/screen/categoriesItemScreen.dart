import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickfix/widget/categories.dart';
import 'package:quickfix/widget/categoriesItem.dart';

class CategoriesitemScreen extends StatelessWidget {
  const CategoriesitemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Categories Item",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: CupertinoSearchTextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Categoriesitem(
                    // name: "yusra badran",
                    // Cprice: "\$ 200",
                    // CassetPath: "assets/images/testS.png",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
