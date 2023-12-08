import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromARGB(255, 255, 254, 254);
const Color buttonColor = Color.fromARGB(255, 35, 82, 39);

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor,
    // Heading font
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily:
            "Montserrat Bold", // Replace with the actual font family name
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: "Lato Bold", // Replace with the actual font family name
        color: Colors.black,
      ),
      // Add more text styles as needed
    ),

    // Body text font
    fontFamily: "Lato Light",

    // Replace with the actual font family name

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        textStyle: const TextStyle(
          fontFamily: "Lato Bold", // Replace with the actual font family name
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
