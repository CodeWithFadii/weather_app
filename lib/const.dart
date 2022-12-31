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
const String apiKey = '7d51073a52b733412913f896bee81c54';

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return 'It\'s 🍦 time';
  } else if (temp > 20) {
    return 'Time for shorts and 👕';
  } else if (temp < 10) {
    return 'You\'ll need 🧣 and 🧤';
  } else {
    return 'Bring a 🧥 just in case';
  }
}
