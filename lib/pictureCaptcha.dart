import 'package:flutter/material.dart';
import 'package:math_captcha/answer_images.dart';
import 'package:math_captcha/data/Questions_list.dart';
import 'package:math_captcha/model/questions.dart';

class AnswerContainer extends StatefulWidget {
  const AnswerContainer({super.key});

  @override
  State<AnswerContainer> createState() => _AnswerContainerState();
}

    var currentQuestionIndex = 0;


class _AnswerContainerState extends State<AnswerContainer> {

  final currentQuestion = questionsData[currentQuestionIndex];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 180,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            ...currentQuestion.getShuffledList().map((value){
              return AnswerImages(answerImages: value);
            })
          ],
        ));
  }
}
