import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.white,
  fontFamily: 'Ubuntu',
);
const purple = Color.fromARGB(255, 76, 64, 211);
const white = Colors.white;
const pinkPurple = Color(0xFFA66AFE);
const gradientBg = LinearGradient(
  colors: [pinkPurple, purple],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
