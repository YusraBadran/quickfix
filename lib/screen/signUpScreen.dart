import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickfix/controller/register_controller.dart';
import 'package:quickfix/screen/loginScreen.dart';
import 'package:quickfix/widget/button1.dart';
import 'package:quickfix/widget/inputfile.dart';

class SignUpPage extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Create an account, It's free ",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Inputfile(
                    controller: registerController.firstNameController,
                    label: "First Name",
                    hintText: "Enter your user name",
                    icon: Icons.person,
                  ),
                  Inputfile(
                    controller: registerController.lastNameController,
                    label: "Last Name",
                    hintText: "Enter your user name",
                    icon: Icons.person,
                  ),
                  Inputfile(
                    controller: registerController.userNameController,
                    label: "Username",
                    hintText: "Enter your user name",
                    icon: Icons.person,
                  ),
                  Inputfile(
                    controller: registerController.phoneNumberController,
                    label: "Phone Number",
                    hintText: "Enter your first name",
                    icon: Icons.phone,
                  ),
                  Inputfile(
                    controller: registerController.emailController,
                    label: "Email",
                    hintText: "Enter your email",
                    icon: Icons.email,
                  ),
                  Inputfile(
                    controller: registerController.passwordController,
                    label: "Password",
                    obscureText: true,
                    hintText: "Enter your password",
                    icon: Icons.password,
                  ),
                  Inputfile(
                    controller: registerController.passwordConfirmController,
                    label: "Confirm Password ",
                    obscureText: true,
                    hintText: "Enter your confirm password",
                    icon: Icons.password,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 0, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: Button1(
                  title: "Sign up",
                  onPress: () {
                    registerController.onSubmit();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// we will be creating a widget for text field
// Widget inputFile({label, obscureText = false, hintText}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color.fromARGB(255, 197, 196, 196)),
//             borderRadius: BorderRadius.circular(50),
//           ),
//           border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: Color.fromARGB(255, 197, 196, 196))),
//           hintText: hintText,
//           hintStyle: TextStyle(fontSize: 10.0),
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       ),
//     ],
//   );
// }
