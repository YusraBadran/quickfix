import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({
    Key? key,
    required this.title,
    required this.onPress,

    // this.textColor,
    // this.btnColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;

  // final Color? textColor;
  // final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 45,
      onPressed: onPress,
      color: Color(0xff80C7F7),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
