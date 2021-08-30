import 'package:calculator_sqflite/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.grey[600],
          centerTitle: true,
          title: Text(
            "Calculator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
