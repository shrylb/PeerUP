// ignore_for_file: library_private_types_in_public_api png, library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peerup/flashcard/practice.dart';
import 'package:peerup/functions/addFlashcard.dart';
import 'package:peerup/functions/addFlashcardSet.dart';
import 'package:peerup/functions/fetchFlashcard.dart';
import 'package:peerup/functions/fetchFlashcardSet.dart';
import 'package:peerup/homepage/technique.dart';
import 'package:peerup/main.dart';
import 'FC_QuizPage.dart';
//import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class Flashcard extends StatefulWidget {
  const Flashcard({super.key});
  @override
  FlashcardState createState() => FlashcardState();
}

class FlashcardState extends State<Flashcard> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> flashcardSets;
  @override
  void initState() {
    super.initState();
    flashcardSets = fetchFlashcardSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAEBD2),
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: const Text(
          'FLASHCARD SETS',
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
      body: StreamBuilder(
          stream: flashcardSets,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.data?.docs == null) {
              return const Text(
                '\n\n\t\t\tNo flashcard sets yet', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF3D405B),
                ),
              );
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Text(
                '\n\n\t\t\tNo flashcard sets yet', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF3D405B),
                ),
                );
            }

            return Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewCard(flashcardSetId: document.id),
                          ),
                        );
                      },
                      child: Container(
                        color: const Color(0xFF),
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          elevation: 2,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text((document.data()
                                    as Map<String, dynamic>)?['name']),
                                subtitle: Text((document.data()
                                    as Map<String, dynamic>)?['desc']),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showOptionsDialog(context);
                                      },
                                      child: const Icon(Icons.more_vert),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const FractionalOffset(0.035, 0.90),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PracticeReview(
                                            flashcardSetId: document.id),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0FA3B1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'PRACTICE',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFDFCF8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFlashcardSet(),
            ),
          );
        },
        child: const Icon(
          Icons.add_rounded, 
          color: Color(0xFFFDFCF8),
          size: 25,
          ),
        backgroundColor:  const Color(0xFF0FA3B1)
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Options'),
          children: <Widget>[
            _buildOption(
              text: 'Edit',
              icon: Icons.edit, // Pen icon
              onTap: () {
                // Add code for the "Edit" option
                Navigator.pop(context);
              },
            ),
            _buildOption(
              text: 'Remove',
              icon: Icons.delete, // Red trash bin icon
              iconColor: Colors.red, // Set the icon color
              onTap: () {
                // Add code for the "Remove" option
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption({
    required String text,
    required IconData icon,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 8), // Adjust the spacing between icon and text
          Text(text),
        ],
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  final answerController = TextEditingController();
  final questionController = TextEditingController();

  final String flashcardSetId;

  AddCard({super.key, required this.flashcardSetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: const Color(0xFFFAEBD2),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Create Flashcard',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: Color(0xFF3D405B)
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                color: Color(0xFFFDFCF8),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextField(
                          controller: questionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: ('Question/Topic'),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Color(0xFF3D405B),
                            fontFamily: 'Poppins',
                            fontSize: 15,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: answerController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Answer/Definition',
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Color(0xFF3D405B),
                            fontFamily: 'Poppins',
                            fontSize: 15,),
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                  const Color(0xFF0FA3B1),
                              ),
                              onPressed: () async {
                                String question = questionController.text;
                                String answer = answerController.text;

                                if (question.isNotEmpty && answer.isNotEmpty) {
                                  await addFlashcard(
                                      flashcardSetId, question, answer);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Flashcard Added",
                                          style: TextStyle(
                                              fontFamily: 'Poppins')),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid Input",
                                          style: TextStyle(
                                              fontFamily: 'Poppins')),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                                questionController.clear();
                                answerController.clear();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('ADD CARD',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFFDFCF8),
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddFlashcardSet extends StatelessWidget {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  AddFlashcardSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: const Color(0xFFFAEBD2),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Flashcard()),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Create Flashcard Set',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: Color(0xFF3D405B)
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                color: Color(0xFFFDFCF8),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: TextField(
                          controller: nameController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: ('Add subject title...\n'),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Color(0xFF3D405B),
                            fontFamily: 'Poppins',
                            fontSize: 15,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: descriptionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Add description...\n',
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Color(0xFF3D405B),
                            fontFamily: 'Poppins',
                            fontSize: 15,),
                        ),
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                  const Color(0xFF0FA3B1),
                              ),
                              onPressed: () async {
                                String name = nameController.text;
                                String description = descriptionController.text;

                                if (name.isNotEmpty && description.isNotEmpty) {
                                  await addFlashcardSet(name, description);

                                  Navigator.of(context).pop();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Invalid Input",
                                          style: TextStyle(
                                            fontFamily: 'Poppins')),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('ADD SET',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFFDFCF8),
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewCard extends StatefulWidget {
  final String flashcardSetId;

  const ViewCard({super.key, required this.flashcardSetId});

  @override
  _ViewCardState createState() => _ViewCardState(flashcardSetId: flashcardSetId);
}

class _ViewCardState extends State<ViewCard> {
  _ViewCardState({required this.flashcardSetId});

  late Stream<QuerySnapshot<Map<String, dynamic>>> flashcards;
  final String flashcardSetId;

  @override
  initState() {
    super.initState();

    flashcards = fetchFlashcards(flashcardSetId);
  }

  bool isHeartFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAEBD2),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
          child: StreamBuilder(
              stream: flashcards,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.data?.docs == null) {
                  return const Text('\n\t\t\tNo flashcard yet');
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                      Text('\n\t\t\tNo flashcard added'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddCard(flashcardSetId: flashcardSetId),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFF0FA3B1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Color(0xFFFDFCF8),
                                ),
                                Text(
                                  'ADD CARD',
                                  style: TextStyle(
                                    color: Color(0xFFFDFCF8),
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Practice(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFF0FA3B1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'PRACTICE',
                                  style: TextStyle(
                                    color: Color(0xFFFDFCF8),
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFFFDFCF8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  );
                  // return const Text('No flashcard yet');
                }

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                    ...snapshot.data!.docs.map((DocumentSnapshot document) {
                      return _buildCard(
                          (document.data() as Map<String, dynamic>)['question'],
                          (document.data() as Map<String, dynamic>)['answer']);
                    }).toList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddCard(flashcardSetId: flashcardSetId),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color(0xFF0FA3B1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Color(0xFFFDFCF8),
                              ),
                              Text(
                                'ADD CARD',
                                style: TextStyle(
                                  color: Color(0xFFFDFCF8),
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeReview(
                                  flashcardSetId: flashcardSetId,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color(0xFF0FA3B1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'PRACTICE',
                                style: TextStyle(
                                  color: Color(0xFFFDFCF8),
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xFFFDFCF8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                );
              })),
    );
  }

  Widget _buildCard(String title, String subtitle) {
    return Card(
      color: const Color(0xFFFDFCF8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                // fontSize: 20, // Set the desired font family
                fontWeight: FontWeight.w700, // Set the desired font weight
                color: Color(0xFF3D405B), // Set the desired font color
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'Poppins', // Set the desired font family
                // fontSize: 15,
                fontWeight: FontWeight.w500, // Set the desired font weight
                color: Color(0xFF3D405B), // Set the desired font color
              ),
            ),
            // contentPadding: const EdgeInsets.all(8.0),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isHeartFilled = !isHeartFilled;
                    });
                  },
                  icon: Icon(
                    isHeartFilled ? Icons.favorite : Icons.favorite_border,
                    color: isHeartFilled ? Colors.red : Color(0xFF3D405B),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showOptionsDialog(context);
                  },
                  child: const Icon(Icons.more_vert, color: Color(0xFF3D405B)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Options'),
          children: <Widget>[
            _buildOption(
              text: 'Edit',
              icon: Icons.edit,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildOption(
              text: 'Remove',
              icon: Icons.delete,
              iconColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOption({
    required String text,
    required IconData icon,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      appBar: AppBar(
        title: const Text('Practice',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFFFAEBD2),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Card(
            color: const Color(0xFFFDFCF8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(
                      'Practice', // Add your text inside the Text widget
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                PracticeCard(
                  title: 'Basic Flashcard Review',
                  subtitle: 'Classic flashcard method',
                  onTap: () {
                    // Navigate to another page for Card 1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewFlashcard(),
                      ),
                    );
                  },
                ),
                PracticeCard(
                  title: 'Multiple Choice',
                  subtitle: 'Select the correct answer',
                  onTap: () {
                    // Navigate to another page for Card 2
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnotherPage(),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Image.asset(
                    'assets/graphics/design1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PracticeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PracticeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xFF0FA3B1),
        child: ListTile(
          title: Text(title,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style: const TextStyle(
                  fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Feature'),
        backgroundColor: const Color(0xFF0FA3B1),
      ),
      body: const Center(
        child: Text(
            textAlign: TextAlign.center,
            'WOW! You have opened a Premium Feature!, access Premium to try this feature out!!'),
      ),
    );
  }
}

class ViewFlashcard extends StatelessWidget {
  const ViewFlashcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Page2Widget()));
              },
              child: Container(
                width: 314,
                height: 420,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0F2),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x40000000),
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Page2Widget()));
                    },
                    child: const Text(
                      'Lorem Ipsum',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2Widget extends StatelessWidget {
  const Page2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0FA3B1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.0, -0.40),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewFlashcard(),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.9, // 90% of screen width
                  height: screenHeight * 0.6, // 60% of screen height
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F0F2),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x40000000),
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Align(
                    alignment: const Alignment(0.00, 0.00),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page2Widget(),
                          ),
                        );
                      },
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Orci ac auctor augue mauris augue neque gravida in fermentum.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.04, // Adjust the font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.70, 0.70),
              child: Text(
                'Did you get it?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: screenWidth * 0.04, // Adjust the font size
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.30, 0.90),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ReviewCompletePage(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Wrong'),
              ),
            ),
            Align(
              alignment: const Alignment(0.30, 0.90),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ReviewCompletePage(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Correct'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCompletePage extends StatelessWidget {
  const ReviewCompletePage(
      {super.key, required this.score, required this.totalItems});
  final int score;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAEBD2),
      body: Center(
        child: InkWell(
          child: Container(
            width: screenWidth * 0.85, // 85% of screen width
            height: screenHeight * 0.65, // 75% of screen height
            decoration: BoxDecoration(
              color: const Color(0xFFFDFCF8),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0xFF3D405B),
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment(-0.73, -0.65),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'Review\nCompleted!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        color: Color(0xFF3D405B),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.90, -1.00),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/graphics/welcome.png',
                      width: screenWidth * 0.25, // Adjust the width
                      height: screenHeight * 0.3, // Adjust the height
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1.24, -0.85),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/graphics/confetti.png',
                      width: screenWidth * 0.3, // Adjust the width
                      height: screenHeight * 0.12, // Adjust the height
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.22, -0.34),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/graphics/confetti.png',
                      width: screenWidth * 0.3, // Adjust the width
                      height: screenHeight * 0.12, // Adjust the height
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.00, 0.25),
                  child: Text(
                    'Score Summary',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20, 
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3D405B),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.04, 0.40),
                  child: Text(
                    "Correct: ${score}",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 66, 244, 119),
                      fontSize: 18, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.05, 0.50),
                  child: Text(
                    "Wrong: ${totalItems - score}",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color(0xFFFF5964),
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.80),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      backgroundColor: const Color(0xFF0FA3B1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Done', 
                      style: TextStyle(
                        color: Color(0xFFFDFCF8),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
