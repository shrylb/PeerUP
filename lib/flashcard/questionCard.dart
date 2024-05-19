import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({super.key, required this.question, required this.onPressed});
  final String question;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(0.0, -0.40),
          child: InkWell(
            onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => const Page2Widget()));
            },
            child: Container(
              width: 314,
              height: 420,
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
              child: Center(
                child: InkWell(
                  onTap: () {
                    onPressed();
                  },
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
