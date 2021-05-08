import 'package:flutter/material.dart';
import 'package:liveasy/screens/mobile_number_001.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liveasy',
      debugShowCheckedModeBanner: false,
      home: MobileNumber001(),
    );
  }
}
