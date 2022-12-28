import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterp/const.dart';
import 'package:flutterp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: purple, // navigation bar color
      statusBarColor: pinkPurple, // status bar color
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
