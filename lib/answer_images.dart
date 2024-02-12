import 'package:flutter/material.dart';

class AnswerImages extends StatelessWidget {
  const AnswerImages({super.key,required this.answerImages});

  final String answerImages;

  @override
  Widget build(BuildContext context) {
    return Image.asset(answerImages);
  }
}
