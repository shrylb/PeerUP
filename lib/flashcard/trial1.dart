// contains: bottom navigation, side menu, tab bar

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        // title: const Text("PeerUP"),
        // titleTextStyle: TextStyle(
        // fontSize: 25,
        // fontFamily: 'Poppins',
        // fontWeight: FontWeight.w600,
        // ),
        // backgroundColor: Color.fromRGBO(100, 147, 165, 1),
        // ),
        body: Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 36,
                child: Container(
                  width: 360,
                  height: 54,
                  decoration: const BoxDecoration(color: Color(0xFF6493A5)),
                ),
              ),
              Positioned(
                left: -1458,
                top: -520,
                child: Container(
                  width: 512,
                  height: 512,
                  padding: const EdgeInsets.only(
                    top: 64,
                    left: 64,
                    right: 63.88,
                    bottom: 63.88,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    // ,
                    // ],
                  ),
                ),
              ),
              Positioned(
                left: -1458,
                top: -520,
                child: Container(
                  width: 512,
                  height: 512,
                  padding: const EdgeInsets.only(
                    top: 127.91,
                    left: 128,
                    right: 128.11,
                    bottom: 127.88,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    // ,
                    // ],
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 120,
                child: SizedBox(
                  width: 333,
                  child: Text(
                    'Flashcard Sets',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 195,
                child: Container(
                  width: 325,
                  height: 114,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6F0F2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 331,
                child: Container(
                  width: 325,
                  height: 114,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6F0F2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 467,
                child: Container(
                  width: 325,
                  height: 114,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE6F0F2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 190,
                child: SizedBox(
                  width: 299,
                  height: 44,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'CMSC 128 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 328,
                child: SizedBox(
                  width: 299,
                  height: 44,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'CMSC 134 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 466,
                child: SizedBox(
                  width: 299,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'CMSC 131 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 234,
                child: SizedBox(
                  width: 299,
                  height: 49,
                  child: Text(
                    'flashcard reviewer for CMSC 128 1st LE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 372,
                child: SizedBox(
                  width: 299,
                  height: 49,
                  child: Text(
                    'flashcard reviewer for CMSC 134 1st LE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 510,
                child: SizedBox(
                  width: 299,
                  height: 49,
                  child: Text(
                    'flashcard reviewer for CMSC 131 1st LE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 264,
                child: Container(
                  width: 98,
                  height: 27,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBAD2F),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFFBAD2F),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 270,
                child: SizedBox(
                  width: 98,
                  child: Text(
                    'PRACTICE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 236,
                top: 95,
                child: SizedBox(
                  width: 106.77,
                  height: 95.23,
                  // child: Stack(children: [
                  // ,
                  // ]),
                ),
              ),
              Positioned(
                left: 313,
                top: 212,
                child: Container(
                  width: 29,
                  height: 22,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/29x22"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 314,
                top: 350,
                child: Container(
                  width: 29,
                  height: 22,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/29x22"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 314,
                top: 480,
                child: Container(
                  width: 29,
                  height: 22,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/29x22"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -674,
                top: 36,
                child: Container(
                  width: 53,
                  height: 52,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/53x52"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 402,
                child: Container(
                  width: 98,
                  height: 27,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBAD2F),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFFBAD2F),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 408,
                child: SizedBox(
                  width: 98,
                  child: Text(
                    'PRACTICE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 537,
                child: Container(
                  width: 98,
                  height: 27,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFBAD2F),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFFBAD2F),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 543,
                child: SizedBox(
                  width: 98,
                  child: Text(
                    'PRACTICE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
