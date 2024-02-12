import 'package:flutter/material.dart';
import 'package:math_captcha/data/Questions_list.dart';
import 'package:math_captcha/model/questions.dart';


class AnswerCard extends StatefulWidget {
  const AnswerCard(
      {super.key, required this.correctAnswerImage, required this.onAnswerSelected});

  final String correctAnswerImage;
  final Function(bool) onAnswerSelected;


  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  bool _isSelected = false;
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsData[currentQuestionIndex];

    // List directionImages = [
    //   'assets/downward.png',
    //   'assets/upward.png',
    //   'assets/left.png',
    //   'assets/right.png',
    // ];
    // Map<String, bool> correctImagesMap = {
    //   'assets/downward.png': false,
    //   'assets/upward.png': false,
    //   'assets/left.png': false,
    //   'assets/right.png': false,
    // };

    // correctImagesMap[widget.correctAnswerImage] = true;


    return GestureDetector(
        onTap: () {

        },
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: _isSelected
              ? (_isCorrect() ? Colors.green : Colors.red)
              : Colors.white,
          child: Stack(
            children: [
            Container(
            height: 180,
            width: 180,
            child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: [


            ],

          ),
        ),
        if (_isSelected)
    Container(
      height: 180,
      width: 180,
      child: Center(
        child: _isSelected
            ? Icon(
          Icons.check_circle,
          size: 50.0,
          color: Colors.white,
        )
            : null,
      ),
    )
    ,
    Container()
    ],
    ),
    ),
    );

  }


  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int currentPageIndex = _pageController.page?.round() ?? 0;
      String correctAnswerImage = questionsData[0].correctAnswer;
      String selectedImage = questionsData[0].answers[currentPageIndex];
      if (correctAnswerImage == selectedImage) {
        print('Correct Answer is selected');
      }
      else {
        print('Incorrect Answer is selected');
      }
    });
  }

  bool _isCorrect() {
    final currentQuestion = questionsData[currentQuestionIndex];
    return widget.correctAnswerImage == currentQuestion.answers;
  }

}


