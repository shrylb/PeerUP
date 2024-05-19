import 'package:flutter/material.dart';
import 'package:peerup/homepage/LogIn.dart';
import 'package:peerup/homepage/loading_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay navigation to the login screen after 2 seconds (for example)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PeerUp()),
      );
    });
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(100, 147, 165, 100),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0FA3B1), // Top color with 50% transparency
              Color(0x800FA3B1), // Middle color fully opaque
              Color(0x30FAEBD2), // Bottom color fully opaque
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Solid text as fill.
              const Text(
                'PEERUP',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFDFCF8),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Stroked text as border.
              // Text(
              //   'PEERUP',
              //   style: TextStyle(
              //     fontFamily: 'Poppins',
              //     fontSize: 48,
              //     fontWeight: FontWeight.bold,
              //     foreground: Paint()
              //       ..style = PaintingStyle.stroke
              //       ..strokeWidth = 2
              //       ..color = const Color(0x9C6493A5),
              //   ),
              // ),
              
              const SizedBox(height: 150),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/graphics/book.gif',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
