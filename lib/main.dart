import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterp/const.dart';
import 'package:flutterp/screens/card_screen.dart';
import 'package:flutterp/screens/home_screen.dart';
import 'package:get/get.dart';
import 'controllers/getapi_controller.dart';
import 'controllers/getvalues_controller.dart';

void main() {
  Get.put(GetValuesController());
  Get.put(GetApiController());
  runApp(
    const MyApp(),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: white, // navigation bar color
      statusBarColor: pinkPurple, // status bar color
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
