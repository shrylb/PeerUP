import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/LogIn.dart';
import 'package:peerup/homepage/homepage.dart';

Future<UserCredential?> logOut(context) async {
  await FirebaseAuth.instance.signOut();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const Login()),
  );
}
