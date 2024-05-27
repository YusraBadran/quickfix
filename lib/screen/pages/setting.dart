import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickfix/screen/loginScreen.dart';
import 'package:quickfix/screen/updateProfileScreen.dart';
import 'package:quickfix/widget/popPolicy.dart';
import 'package:quickfix/widget/popTerm.dart';
import 'package:quickfix/widget/profileMenu.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //void to whatsapp
  void launchWhatsApp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("can't open whatsapp");
  }

  //void to term
  void _openTerms() {
    showModalBottomSheet(context: context, builder: (ctx) => term());
  }

  //void to policy
  void _openPolicy() {
    showModalBottomSheet(context: context, builder: (ctx) => policy());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SETTING",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff80C7F7),
      ),
      backgroundColor: Color.fromARGB(140, 243, 250, 255),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                // child: Image.asset("assets/images/userProfile.png"),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage("assets/images/userProfile.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "User Name",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                "username@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Updateprofilescreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      shape: const StadiumBorder(),
                      side: BorderSide.none),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                "About US",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 10),
              profileMenuWidget(
                title: "Call Us",
                icon: Icons.phone,
                onPress: () async {
                  FlutterPhoneDirectCaller.callNumber("+967777914188");
                },
              ),
              profileMenuWidget(
                title: "Text Us (WhatsApp)",
                icon: Icons.message,
                onPress: () {
                  launchWhatsApp(number: "+967777914188", message: "Hello");
                },
              ),
              const Divider(),
              Text(
                "About App",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              profileMenuWidget(
                title: "Terms & Conditions",
                icon: Icons.gavel,
                onPress: () {
                  _openTerms();
                },
              ),
              profileMenuWidget(
                title: "Exchange & Return Policy",
                icon: Icons.undo_outlined,
                onPress: () {
                  _openPolicy();
                },
              ),
              const Divider(),
              profileMenuWidget(
                title: "Log Out ",
                icon: Icons.logout,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
