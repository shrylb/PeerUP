import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeRoute(),
  ));
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PeerUP"),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: const Color.fromRGBO(100, 147, 165, 1),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Flashcard Technique'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            }),
      ),
    );
  }
}

//Flashcard Set Page 1
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: const Color.fromRGBO(100, 147, 165, 1),
        ),
        body: ListView(children: [
          const Positioned(
            left: 50,
            top: 120,
            // elevation: 12;
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
          Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: const Color(0xFFE6F0F2),
            child: const ListTile(
              // leading: image here
              title: Text(
                'CMSC 128',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              subtitle: Text(
                'flashcard reviewer for CMSC 128 LE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: const Color(0xFFE6F0F2),
            child: const ListTile(
              // leading: image here
              title: Text(
                'CMSC 131',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              subtitle: Text(
                'flashcard reviewer for CMSC 131 LE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            elevation: 12, // You can specify the elevation as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: const Color(0xFFE6F0F2),
            child: const ListTile(
              // leading: image here
              title: Text(
                'CMSC 134',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              subtitle: Text(
                'flashcard reviewer for CMSC 134 LE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(100, 147, 165, 1),
          elevation: 10.0,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeRoute()),
            );
          },
        ));
  }
}

// Page for Viewing the
class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: []
          ),
      body: const Column(children: []),
    );
  }
}
