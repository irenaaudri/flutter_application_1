import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/LoginPage.dart';
 
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.pink[100]
      ),
      home: Loginpage(),
    );
  }
}