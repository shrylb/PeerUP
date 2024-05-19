//main
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:expansion_tile_card/expansion_tile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.article_rounded)),
                Tab(icon: Icon(Icons.grade)),
                Tab(icon: Icon(Icons.account_circle_rounded)),
              ],
            ),
            title: const Text("PeerUP"),
            titleTextStyle: const TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: const Color.fromRGBO(100, 147, 165, 1),
          ),
          drawer: Drawer(
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(100, 147, 165, 1),
                  ),
                  child: Text(
                    'Study Techniques',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Pomodoro'),
                ),
                ListTile(
                  title: Text('Flashcard'),
                ),
              ],
            ),
          ),
          body: const Center(
            child: Text(
              'PEERUP: acads now lakads later',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 40.0,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 10.0,
            child: const Icon(Icons.add),
            onPressed: () {
              // actions here
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              fixedColor: const Color.fromRGBO(100, 147, 165, 1),
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "History",
                  icon: Icon(Icons.access_time),
                ),
                BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(Icons.settings),
                ),
              ],
              onTap: (int indexOfItem) {}),
        ),
      ),
    );
  }
}
