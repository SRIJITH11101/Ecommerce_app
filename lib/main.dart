import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(const ondc());
}

class ondc extends StatelessWidget {
  const ondc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
