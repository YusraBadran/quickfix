import 'package:flutter/material.dart';

class term extends StatelessWidget {
  const term({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 16, 16, 30),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text("Terms & Conditions ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff80C7F7))),
              Text(
                  "About info The error operation: platform_operatingSystem typically info The error operation: platform_operatingSystem typically i info The error operation: platform_operatingSystem typically i indicates anAbout info The error message unsupported operation: platform_operatingSystem typically indicates an issue with the version of the Flutter SDK or a compatibility problem with the operating system issue with the version of the Flutter SDK or a compatibility problem with the operating system"),
            ],
          ),
        ),
      ),
    );
  }
}
