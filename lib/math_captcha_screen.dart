import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_captcha/images_captcha_screen.dart';

class MathCaptchaScreen extends StatefulWidget {
  const MathCaptchaScreen({super.key});

  @override
  State<MathCaptchaScreen> createState() => _MathCaptchaScreenState();
}

class _MathCaptchaScreenState extends State<MathCaptchaScreen> {
  int num1 = Random().nextInt(15);
  int num2 = Random().nextInt(15);
  String operator = '';
  int result = 0;
  String randomString='';
  final _answerController = TextEditingController();

  void regenerateCaptcha(){
    setState(() {
      buildCaptcha();
    });
  }


  void buildCaptcha(){
    int num1 = Random().nextInt(10)+1;
    int num2 = Random().nextInt(10)+1;
    operator = Random().nextBool() ? '+' : '-';
    if(operator == '+'){
      result = num1 + num2;
    }
    else
      {
        result = num1 - num2;
      }
    randomString = '$num1 $operator $num2 = ';
  }

  @override
  void initState() {
    super.initState();
    result = num1 + num2;
    buildCaptcha();
  }


  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: 200.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(144, 255, 215, 64),
                      border: Border.all(width: 1.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(randomString,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                        ),
                        Container(
                          width: 80,
                          padding: EdgeInsets.only(top: 10.0,left: 5.0, right: 10.0, bottom: 5.0),
                            child: TextField(
                              controller: _answerController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,showCursor: false,decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )
                            ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                IconButton(onPressed: regenerateCaptcha , icon: Icon(Icons.refresh_outlined),
                iconSize: 40.0,color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(onPressed: (){
              if(int.parse(_answerController.text) == result){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                   title: Text('Success'),
                   content:Text('Captcha verified!'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageCaptchaScreen()));
                      }, child: Text('Okay'))
                    ],
                  );
                });
              }
              else{
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('Incorrect answer, please try again.'),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Okay'))
                    ],
                  );
                });
              }
            }, child: Text('SUBMIT',
              style: TextStyle(
                color: Colors.white
              ),
            ),style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan), // Change the background color
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(16)), // Change the padding
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Change the border radius
                ),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Change the text color
            ), ),
          ],
        ),
      ),
    );
  }
}
