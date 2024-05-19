import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/LogIn.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/splash_screen.dart';
import 'package:peerup/homepage/mainpage.dart';
import 'package:peerup/main.dart';

class PeerUp extends StatefulWidget {
  const PeerUp({super.key});

  @override
  PeerUpState createState() => PeerUpState();
}

class PeerUpState extends State<PeerUp> {
  // late StreamSubscription<User?> authSubscription;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   authSubscription =
  //       FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print("User is currently signed out.");
  //     } else {
  //       print("user is signed in.\nuser id: ${user.uid}");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.hasData) {
            return MainPage();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
