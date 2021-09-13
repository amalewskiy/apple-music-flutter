import 'package:apple_music/appleMusic.dart';
import 'package:apple_music/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Apple Music',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        home: AppleMusic());
  }
}
