import 'package:flutter/material.dart';

class profileMenuWidget extends StatelessWidget {
  const profileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(240, 234, 247, 255),
        ),
        child: Icon(
          icon,
          color: Color(0xff80C7F7),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
        ).apply(color: textColor),
      ),
      // trailing: endIcon
      //     ? Container(
      //         width: 30,
      //         height: 30,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(100),
      //           color: Colors.grey.withOpacity(0.1),
      //         ),
      //         child:
      //             Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey),
      //       )
      //     : null,
    );
  }
}
