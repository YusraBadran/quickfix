import 'package:flutter/material.dart';
import 'package:quickfix/widget/button1.dart';

class Updateprofilescreen extends StatelessWidget {
  const Updateprofilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.white), // Change the color as needed
            onPressed: () => Navigator.of(context).pop(),
          ),
          // automaticallyImplyLeading: false,
          title: Text(
            "EDIT PROFILE",
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
          padding: EdgeInsets.only(left: 40, right: 40, top: 40),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const Image(
                        image: AssetImage("assets/images/userProfile.png"))),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: <Widget>[
                  // Inputfile(
                  //   label: "First Name",
                  //   hintText: "Enter your user name",
                  //   icon: Icons.person,
                  // ),
                  // Inputfile(
                  //   label: "Last Name",
                  //   hintText: "Enter your user name",
                  //   icon: Icons.person,
                  // ),
                  // Inputfile(
                  //   label: "Username",
                  //   hintText: "Enter your user name",
                  //   icon: Icons.person,
                  // ),
                  // Inputfile(
                  //   label: "Phone Number",
                  //   hintText: "Enter your first name",
                  //   icon: Icons.phone,
                  // ),
                  // Inputfile(
                  //   label: "Email",
                  //   hintText: "Enter your email",
                  //   icon: Icons.email,
                  // ),
                  // Inputfile(
                  //   label: "Password",
                  //   obscureText: true,
                  //   hintText: "Enter your password",
                  //   icon: Icons.password,
                  // ),
                  // Inputfile(
                  //   label: "Confirm Password ",
                  //   obscureText: true,
                  //   hintText: "Enter your confirm password",
                  //   icon: Icons.password,
                  // ),

                  Button1(
                    title: "Edit Profile",
                    onPress: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Homescreen()),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
