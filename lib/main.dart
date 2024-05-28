import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/client/bad_certificate_callback.dart';
import 'package:quickfix/core/localization/app_localization_service.dart';
import 'package:quickfix/screen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      navigatorKey: Get.key,
      fallbackLocale: const Locale("en"),
      locale: const Locale("ar"),
      translations: AppLocalizationService(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: splashScreen(),
    );
  }
}
