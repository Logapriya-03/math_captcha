import 'package:flutter/material.dart';
import 'package:math_captcha/answer_card.dart';
import 'package:math_captcha/data/Questions_list.dart';
import 'package:math_captcha/model/questions.dart';

class StartCaptchaScreen extends StatefulWidget {
  const StartCaptchaScreen({super.key});

  @override
  State<StartCaptchaScreen> createState() => _StartCaptchaScreenState();
}

class _StartCaptchaScreenState extends State<StartCaptchaScreen> {

  var currentQuestionIndex = 0;



  @override
  Widget build(BuildContext context) {

    final currentQuestion = questionsData[currentQuestionIndex];
    final correctImage = currentQuestion.answers;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Image.asset(
                  currentQuestion.questions,
                  height: 180,
                  width: 180,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              AnswerCard(correctAnswerImage: correctImage, onAnswerSelected: (isCorrect) {
                if (isCorrect) {
                  // Handle correct answer logic here
                  // You can change the card color or do any other actions
                } else {
                  // Handle incorrect answer logic here
                  // You can change the card color or do any other actions
                }
              })
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            'Select the correct direction of the handle',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Refresh',
                  style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.refresh_outlined,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
