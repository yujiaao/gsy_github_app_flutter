import 'package:flutter/material.dart';
import 'dart:ui';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("this is my app"),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(colorScheme: ColorScheme.dark()),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Text(
          "完全flutter",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.blue[200], fontSize: 40),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
