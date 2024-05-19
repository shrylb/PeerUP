import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peerup/functions/signup.dart';
import 'package:peerup/homepage/LogIn.dart';

void main() {
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Text(
                  'Hello, Peer!',
                  style: TextStyle(
                    color: Color(0xFF3D405B),
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/graphics/wws.png',
                width: 290,
                height: 200,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 270,
                height: 50,
                child: TextFormWidget(
                  hintText: 'Enter Email',
                  obscureText: false,
                  marginBottom: 10,
                  borderColor: const Color(0xFFFDFCF8),
                  focusColor: Colors.red,
                  removeBorder: true,
                  controller: emailController,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 270,
                height: 50,
                child: PasswordTextFormWidget(
                  hintText: 'Enter Password',
                  obscureText: true,
                  marginBottom: 10,
                  borderColor: const Color(0xFFFDFCF8),
                  focusColor: Colors.red,
                  removeBorder: true,
                  controller: passwordController,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Center(
              child: SizedBox(
                  width: 270,
                  height: 40,
                  child: Text(
                    "Password must be at least 6 characters.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 185,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    UserCredential? userCredential = await signUp(
                        emailController.text, passwordController.text, context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF0FA3B1)),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xFFF9F7F3),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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

class TextFormWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final double marginBottom;
  final Color? borderColor;
  final Color? focusColor;
  final bool removeBorder;
  final TextEditingController controller; // Add this line

  TextFormWidget({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
    required this.controller, // Initialize the controller
  });

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      child: TextFormField(
        controller: widget.controller, // Assign the controller to TextFormField

        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          border: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.white,
                  ),
                ),
          focusedBorder: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.focusColor ?? Colors.blue,
                  ),
                ),
        ),
      ),
    );
  }
}

class PasswordTextFormWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final double marginBottom;
  final Color? borderColor;
  final Color? focusColor;
  final bool removeBorder;
  final TextEditingController controller; // Add this line

  PasswordTextFormWidget({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.marginBottom = 0,
    this.borderColor,
    this.focusColor,
    this.removeBorder = false,
    required this.controller, // Initialize the controller
  });

  @override
  _PasswordTextFormWidgetState createState() => _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool isObscured = true;

  void toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          border: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.black,
                  ),
                ),
          focusedBorder: widget.removeBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.focusColor ?? Colors.blue,
                  ),
                ),
          suffixIcon: IconButton(
            onPressed: toggleObscureText,
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}
