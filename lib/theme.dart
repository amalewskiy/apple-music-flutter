import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Color(0xFFF94C57),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        centerTitle: false, elevation: 0, backgroundColor: Colors.transparent),
    // iconTheme: IconThemeData(color: kContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorLightTheme),
    // colorScheme: ColorScheme.light(
    //   primary: kPrimaryColor,
    //   secondary: kSecondaryColor,
    //   error: kErrorColor,
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFF94C57),
      unselectedItemColor: Color(0xFFC2CAD7),
      selectedIconTheme: IconThemeData(color: Color(0xFFF94C57)),
      showUnselectedLabels: true,
    ),
  );
}
