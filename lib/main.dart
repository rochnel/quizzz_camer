import 'package:flutter/material.dart';
import 'package:quizzcamer/homeSreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: HomeSreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

