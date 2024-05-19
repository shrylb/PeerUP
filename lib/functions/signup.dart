import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peerup/homepage/LogIn.dart';
import 'package:peerup/homepage/homepage.dart';
import 'package:peerup/homepage/mainpage.dart';

Future<UserCredential?> signUp(
    String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => const MainPage()),
    );

    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return null;
  } catch (e) {
    print(e);
    return null;
  }
}
