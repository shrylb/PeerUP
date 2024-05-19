import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerup/functions/logout.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;

  File? _pickedImage;

  @override
  void initState() {
    super.initState();

    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textFieldFocusNode1 = FocusNode();
    _textFieldFocusNode2 = FocusNode();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();

    super.dispose();
  }

    Future<void> updateEmailAndPassword() async {
    try {
      final String newEmail = _textController1.text.trim();
      final String newPassword = _textController2.text.trim();

      if (newEmail.isNotEmpty && newPassword.isNotEmpty) {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await user.updateEmail(newEmail);
          await user.updatePassword(newPassword);
          print('Email and password updated successfully!');
        } else {
          print('User is not authenticated.');
        }
      } else {
        print('Email or password cannot be empty.');
      }
    } catch (e) {
      print('Error updating email and password: $e');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_textFieldFocusNode1.canRequestFocus) {
          FocusScope.of(context).requestFocus(_textFieldFocusNode1);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFAEBD2),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Adjust the height as needed

                GestureDetector(
                  onTap: () async {
                    await _pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: _pickedImage != null
                          ? DecorationImage(
                              image: FileImage(_pickedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _pickedImage == null
                        ? const Icon(Icons.add_a_photo)
                        : null,
                  ),
                ),
                const SizedBox(height: 20), // Adjust the height as needed

                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3D405B),
                  ),
                ),
                const SizedBox(height: 50), // Adjust the height as needed

                // Change Password text box section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: TextFormField(
                    controller: _textController1,
                    focusNode: _textFieldFocusNode1,
                    decoration: const InputDecoration(labelText: 'Change Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF3D405B),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50), // Adjust the height as needed

                // Change Password text box section
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: TextFormField(
                    controller: _textController2,
                    focusNode: _textFieldFocusNode2,
                    decoration: const InputDecoration(
                      labelText: 'Change Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF3D405B),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),

                // Save Changes floating button
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: const Text('Save Changes', style: TextStyle(color: Color(0xFFFDFCF8))),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0FA3B1),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Log Out floating button
                ElevatedButton(
                  onPressed: () {
                    logOut(context);
                  },
                  child: const Text('LOGOUT', style: TextStyle(color: Color(0xFFFDFCF8))),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7A072),
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


