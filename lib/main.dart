import 'package:flutter/material.dart';
import 'package:math_captcha/math_captcha_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MathCaptchaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
