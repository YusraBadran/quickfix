import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/screen/detailsScreen.dart';

class Categoriesitem extends StatefulWidget {
  const Categoriesitem(
      {this.UassetPath, this.Uname, this.Uprice, this.onPressed});
  final UassetPath, Uname, Uprice;
  final VoidCallback? onPressed;

  @override
  State<Categoriesitem> createState() => _CategoriesitemState();
}

class _CategoriesitemState extends State<Categoriesitem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the Container in a GestureDetector
      onTap: widget.onPressed ?? () => {},
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
          // color: Color(0xff80C7F7),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 10, 112, 180).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
                child: widget.UassetPath == null
                    ? Image.asset(
                        "assets/images/testS.png",
                        height: 50,
                        width: 90,
                      )
                    : Image.network(ApiUrls.baseImageUrl + widget.UassetPath)),
            Container(
              child: Text(
                widget.Uname,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              child: Text(
                widget.Uprice,
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
