import 'package:flutter/material.dart';
import 'package:math_captcha/pictureCaptcha.dart';
import 'package:math_captcha/start_captcha_screen.dart';

class ImageCaptchaScreen extends StatefulWidget {
  const ImageCaptchaScreen({super.key});

  @override
  State<ImageCaptchaScreen> createState() => _ImageCaptchaScreenState();
}

class _ImageCaptchaScreenState extends State<ImageCaptchaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(80, 231, 172, 226),
              Color.fromARGB(80, 164, 214, 222)
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: StartCaptchaScreen(),
      ),
    );
  }
}
