import 'package:flutter/material.dart';
import 'package:loginpage/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikkhu Ras',
      home: Welcome(),
    );
  }
}
