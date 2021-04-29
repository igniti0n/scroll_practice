import 'package:flutter/material.dart';
import 'package:scroll_practice/practice_scree.dart/practice_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          headline1: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: PracticeScreen(),
    );
  }
}
