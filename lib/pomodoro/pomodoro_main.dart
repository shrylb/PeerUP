import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/technique.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);
  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  final CountDownController _controller = CountDownController();
  bool _isStarted = false;
  bool _isOngoing = false;
  bool _focus = true;
  bool _short = false;
  int _focusTimer = 1500;
  int _focusNum = 2;
  final int _shortBreak = 5;
  final int _longBreak =7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: 
        const Text(
          'POMODORO',
          style: TextStyle(
            color: Color(0xFF3D405B),
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFAEBD2),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Techniques()),
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFFAEBD2)),
            child: SvgPicture.asset(
              'assets/icons/back-arrow.svg',
              height: 20.0,
              width: 20.0,
            ),
          ),
        ),
      ),
      
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 200.0),
            margin: const EdgeInsets.all(50.0),
            child: Center(
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 1.75,
                height: MediaQuery.of(context).size.height / 1.75,
                duration: _focusTimer,
                fillColor: const Color(0xFF0FA3B1),
                ringColor: Color(_isStarted ? 0x450FA3B1 : 0xFF0FA3B1),
                controller: _controller,
                backgroundColor: const Color(0xFFFAEBD2),
                strokeWidth: 15.0,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverseAnimation: true,
                isReverse: true,
                autoStart: false,
                textFormat: CountdownTextFormat.MM_SS,
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D405B),
                ),
                onComplete: () {
                  if (_isOngoing) {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return const Dialog(
                          insetAnimationDuration: Duration(seconds: 2),
                          insetPadding: EdgeInsets.all(25.0),
                          backgroundColor: Color(0xFFF9F7F3),
                          shadowColor: Color(0xFF3D405B),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "You finished your first Pomodoro!",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    //_controller.reset();
                  }
                },
              ),
            ),
          ),
          Container(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 70.0),
        height: 50.0,
        width: 120.0,
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF0FA3B1),
          onPressed: () {
            setState(() {
              if (_isStarted == false) {
                _isStarted = true;
                _isOngoing = true;
                _controller.start();
              } else if (_isStarted == true && _isOngoing == true) {
                _isStarted = false;
                _isOngoing = false;
                _controller.reset();
              }
            });
          },
          label: Text(
            _isStarted ? 'RESET' : 'START',
            style: const TextStyle(
              color: Color(0xFFFDFCF8),
              fontFamily: 'Poppins',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _startNextTimer() {
  if (_isOngoing) {
    setState(() { // Switch between focus and short break
      _focus = false;
      _short = true;
    });

    int nextTimerDuration = _shortBreak;

    //_controller.stop(); // Stop the current timer
    //_controller.setTime(Duration(minutes: nextTimerDuration));
    _controller.start(); // Start the next timer
  } 
}
}
