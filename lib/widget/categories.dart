import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickfix/screen/detailsScreen.dart';

class Categories extends StatelessWidget {
  const Categories({this.CassetPath, this.Cname, this.Cprice});
  final CassetPath, Cname, Cprice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: GridView.count(
          childAspectRatio: 0.99,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            for (int i = 0; i < 2; i++)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailsscreen(
                                DassetPath: CassetPath,
                                Dname: Cname,
                                Dprice: Cprice,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    // color: Color(0xff80C7F7),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 10, 112, 180).withOpacity(0.2),
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
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            CassetPath,
                            // "assets/images/testS.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          Cname,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          Cprice,
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
