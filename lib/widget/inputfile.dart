import 'package:flutter/material.dart';

class Inputfile extends StatelessWidget {
  const Inputfile({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = true,
  }) : super(key: key);
  final String label;
  final String hintText;
  final IconData icon;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            style: TextStyle(fontSize: 10),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              labelText: label,
              labelStyle: TextStyle(fontSize: 11.0),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 10.0),
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 1, 141, 255))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
