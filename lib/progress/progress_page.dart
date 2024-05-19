// dependencies:
//   flutter:
//     sdk: flutter
//   intl: ^0.16.0
//   table_calendar: ^2.3.3
//   # simple_gesture_detect

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // Define the primary color for the app
      primaryColor: Colors.black,
    ),
    home: ProgressPage(),
  ));
}

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late Timer _timer;
  DateTime? lastUsedDate;

  // Customize timer font and color
  final TextStyle timerStyle = TextStyle(fontSize: 36, color: Colors.black);

  @override
  void initState() {
    super.initState();
    _loadLastUsedDate();
    _startTimer();
  }

  void _loadLastUsedDate() {
    // Load the last used date from storage (you might use shared_preferences or other storage solutions)
    // For now, let's use a placeholder value of null
    // Replace this with actual logic to load the last used date from your storage solution
    lastUsedDate = null; // Replace this line
  }

  void _startTimer() {
    // Timer that updates every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
      ),
      body: Column(
        children: [
          // Spacer to push the timer to the upper-middle part
          Spacer(),

          // Timer Section in the upper-middle part
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _formattedTime(),
                style: timerStyle,
              ),
            ),
          ),

          // Calendar Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _markedDays(),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation item taps here
        },
      ),
    );
  }

  String _formattedTime() {
    if (lastUsedDate == null) {
      return '0:00:00';
    }

    Duration timeDifference = DateTime.now().difference(lastUsedDate!);
    int hours = timeDifference.inHours;
    int minutes = (timeDifference.inMinutes % 60);
    int seconds = (timeDifference.inSeconds % 60);

    return '$hours:$minutes:$seconds';
  }

  String _markedDays() {
    if (lastUsedDate == null) {
      return 'No days marked on the calendar';
    }

    String formattedDate = DateFormat.yMd().format(lastUsedDate!);
    return 'Marked Days: $formattedDate';
  }
}
