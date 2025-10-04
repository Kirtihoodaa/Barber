import 'package:barber/AdminPanel/ADminHomePage.dart';
import 'package:barber/UI%20Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Adminhomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
