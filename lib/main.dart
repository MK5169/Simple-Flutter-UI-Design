import 'package:cryptoworld/signup.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
