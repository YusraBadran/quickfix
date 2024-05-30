import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/core/storage/storage.dart';
import 'package:quickfix/screen/homeScreen.dart';
import 'package:quickfix/screen/loginScreen.dart';
import 'package:quickfix/screen/pages/home.dart';

import 'package:quickfix/screen/welcomescreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  void initState() {
    Storage().initHive();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      if (Storage().readFromUserBox(LocalStorageKeys.isFirstTime.name) ==
          true) {
        Get.to(Welcomescreen());
      } else {
        if (Storage().readFromUserBox(LocalStorageKeys.token.name) != null) {
          Get.to(HomeScreen());
        } else {
          Get.to(LoginPage());
        }
      }
    });
    super.initState();
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
            child: Image.asset(
          'assets/images/logo.png',
          height: animation.value * 160,
        )),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Made In Yemen",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
