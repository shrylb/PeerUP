import 'package:flutter/material.dart';
import 'package:peerup/flashcard/flashcard_main.dart';

class AnswerCard extends StatelessWidget {
  AnswerCard(
      {super.key,
      required this.answer,
      required this.onPressed,
      required this.onCorrect,
      required this.onWrong});
  final String answer;
  final Function() onPressed;
  final Function() onCorrect;
  final Function() onWrong;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.40),
            child: InkWell(
              onTap: () {
                onPressed();
              },
              child: Container(
                width: screenWidth * 0.9, // 90% of screen width
                height: screenHeight * 0.6, // 60% of screen height
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0F2),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: const Alignment(0.00, 0.00),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Page2Widget(),
                      //   ),
                      // );
                    },
                    child: Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.04, // Adjust the font size
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.70, 0.70),
            child: Text(
              'Did you get it?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: screenWidth * 0.04, // Adjust the font size
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.30, 0.90),
            child: ElevatedButton(
              onPressed: () {
                onWrong();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Wrong'),
            ),
          ),
          Align(
            alignment: const Alignment(0.30, 0.90),
            child: ElevatedButton(
              onPressed: () {
                onCorrect();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Correct'),
            ),
          ),
        ],
      ),
    );
  }
}
