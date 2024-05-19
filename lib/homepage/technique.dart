// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/mainpage.dart';
import 'package:peerup/pomodoro/pomodoro_main.dart';

class Techniques extends StatelessWidget {
  const Techniques({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  ),
        child: SvgPicture.asset(
          'assets/icons/home.svg',
          height: 30.0,
          width: 30.0,
          color: Color(0xFF3D405B),
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0FA3B1), // Top color with 50% transparency
              Color(0x600FA3B1),  // Middle color fully opaque
              Color(0x30F2CC8F), // Bottom color fully opaque
            ],
          ),
        ),
        //top: true,
        child: Stack(
          children: [
            // Study girl illustration
            Container(
              alignment: const Alignment(-0.04, -0.70),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/graphics/girl-study.png',
                  width: 215,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Choose your focus text space
            Container(
              alignment: const Alignment(0, -0.10),
              child: Text(
                'CHOOSE YOUR FOCUS',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF3D405B),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            // Pomodoro button section
            // Container(
            //   alignment: const Alignment(-0.5, 0.20),
            //   child: GestureDetector(
            //     onTap: () {
            //       showPomodoroDialog(context);
            //     },
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Image.asset(
            //         'assets/graphics/Rectangle.png',
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),

            Container(
               alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 50, top: 385),
              padding: const EdgeInsets.all(10),
               child: Text(
                    'POMODORO',
                    //textAlign: TextAlign.left,
                      style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF3D405B),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                )
              ),
            ),

            Container(
               alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 230, top: 385),
              padding: const EdgeInsets.all(10),
               child: Text(
                    'FLASHCARDS',
                    //textAlign: TextAlign.left,
                      style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF3D405B),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                )
              ),
            ),

            Container(
              height: 145,
              width: 145,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 45, top: 450),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFFDFCF8),
                  borderRadius: BorderRadius.circular(10),
                ),
              child: GestureDetector(
                onTap: () {
                  showPomodoroDialog(context);
                },
                child: ClipRRect(
                  //borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/graphics/pomodoro-icon.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),

            Container(
              height: 145,
              width: 145,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(left: 225, top: 450),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFFDFCF8),
                  borderRadius: BorderRadius.circular(10),
                ),
              child: GestureDetector(
                onTap: () {
                  showFlashcardDialog(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/graphics/flashcard-icon.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showPomodoroDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFDFCF8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/graphics/clock.png',
                    width: 230,
                    height: 145,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(width: 50, height: 25), 
                const Text(
                  'POMODORO',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3D405B),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 30, height: 30),
              ],
            ),
            const Text('Pomodoro is a time management study method based on 25-minute stretches of focused work broken by 5-minute breaks with 15-minute long breaks after consecutive Pomodoro sessions.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 30, height: 30), 
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: const Color(0xFF0FA3B1)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pomodoro(),
                    ),
                  );
                },
                child: const Text('Use Pomodoro',
                style: TextStyle(
                 color: Color(0xFFFDFCF8),
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showFlashcardDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFDFCF8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/graphics/quiz.png',
                    width: 230,
                    height: 145,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(width: 50, height: 25), // Add some spacing between the image and text
                const Text(
                  'FLASHCARDS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color:  Color(0xFF3D405B),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 30, height: 30),
              ],
            ),
            const Text('The Flashcard study technique helps engage learners in an active learning exercises that simulates the memories.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 30, height: 30), 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: const Color(0xFF0FA3B1)
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Flashcard(),
                  ),
                );
              },
              child: const Text('Use Flaschcard',
              style: TextStyle(
                 color: Color(0xFFFDFCF8),
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class PopUpPageWidget extends StatelessWidget {
  const PopUpPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor:
            const Color(0xFFFAEBD2), // Change to your desired background color
        appBar: AppBar(
          backgroundColor: const Color(0xFF0FA3B1),
          title: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFF9F7F3),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // title: const Text(
          //   'Page Title',
          //   style: TextStyle(
          //     fontFamily: 'Outfit',
          //     color: Color(0xFFF9F7F3),
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          actions: const [],
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 439,
              decoration: BoxDecoration(
                color: const Color(0xFFFAEBD2), // Change to your desired color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    width: 230,
                    height: 287,
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFFF9F7F3), // Change to your desired color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo elit at. Ac orci phasellus egestas tellus rutrum tellus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Use Technique'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Clock.png',
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'POMODORO',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF333232),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
