import 'package:flutter/material.dart';

const MaterialColor primaryColor =  MaterialColor(
  0xFF7ED957,   <int, Color>{
    500:  Color(0xFF7ED957),
  },);
const Color backgroundColor = Colors.grey;
const Color buttonColor = Color.fromARGB(255, 17, 79, 10)B(255, 26, 255, 0);

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: primaryColor,
    scaffoldBackgroundColor: backgroundColor,

    // Heading font
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: "HeadingFont", // Replace with the actual font family name
        color: Colors.black,
      ),
      // Add more text styles as needed
    ),

    // Body text font
    fontFamily: "BodyFont", // Replace with the actual font family name

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: "ButtonFont", // Replace with the actual font family name
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
