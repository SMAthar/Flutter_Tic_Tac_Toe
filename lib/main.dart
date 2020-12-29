import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF0e6ba8),
        appBar: AppBar(
          backgroundColor: Color(0xFF0e6ba8),
          elevation: 0.7,
          title: Text("Tic Tac Toe"),
          centerTitle: true,
        ),
        body: Container(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
